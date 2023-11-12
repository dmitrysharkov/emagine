# frozen_string_literal: true

require_relative "lib/emagine/version"

Gem::Specification.new do |spec|
  spec.name = "emagine"
  spec.version = Emagine::VERSION
  spec.authors = ["Dmitry Sharkov"]
  spec.email = ["dmitry.sharkov@gmail.com"]

  spec.summary = "Event machine on Ruby"
  spec.description = "It's my early experiment. Don't watch it. Don't use it :)"
  spec.homepage = "https://rubygems.org/gems/emagine"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "https://rubygems.org/gems/emagine"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dmitrysharkov/emagine"
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  # spec.add_runtime_dependency "zeitwerk", "~> 2.6"
end
