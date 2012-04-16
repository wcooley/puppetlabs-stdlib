#
module Puppet::Parser::Functions
  newfunction(:generate_cached, :type => :rvalue,

    :doc => "
Wraps the built-in _generate_ function and caches the output for a specified
period of time. Returns the same output as _generate_ would, except that the
output changes only after cache expiration.

* *Parameters*:
    * _command_  External command. See documentation _generate_ function for
    restrictions and details.
    * _ttl_  Optional. Lifetime of the cached data, in seconds. Default is 300s (5m).
") \
  do |args|

  command = args[0]
  ttl = args[1].to_i || 300

  Puppet::Parser::Functions.autoloader.load(:generate) \
    unless Puppet::Parser::Functions.autoloader.loaded?(:generate)

  function_generate(command)
  end
end
