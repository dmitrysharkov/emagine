#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

path = "#{__dir__}/../lib/emagine/s_parser/yy_parse.rb"
copy_path = "#{path}.#{Time.now.to_i}.copy"
FileUtils.mv(path, copy_path, force: true)


tmp_path = "#{__dir__}/yy_parse.rb"
grammar_path = "#{__dir__}/grammar.bnf"

`syntax-cli -g #{grammar_path} -m LALR1 -o #{tmp_path}`

File.open(path, "w") do |file|
  File.foreach(tmp_path) do |line|
    line = line.gsub(/_(\d+)/, '_x\1')
    line = "\n" if line.include?('class') && line.include?('< YYParse; end')

    file.puts(line)
  end
end

FileUtils.rm(tmp_path, force: true)


