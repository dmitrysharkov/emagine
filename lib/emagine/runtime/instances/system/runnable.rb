# runnable is bundle of procedure instance (function instance) + substituted parameters
# runnable#run_step(context, stack) OR
#    scope = ??
#

# runnable#run(context):
#    stack = [{procedure: self.procedure, command_index: [0], scope: Scope.new(params, config, context)}]
#    run_step(context, stack) while !stack.empty?
