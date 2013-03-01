#!/usr/bin/env ruby
# riffing on a tune by Paul at po-ru.com
# 1. Using a bash shell, install rvm according to instructions.
# 2. Install this script in your path, say in ~/bin.
# 3. Make it executable.
# 4. Add the following alias to your .tcshrc:
#      alias rvm 'eval `~/bin/rvm.rb \!*`'
# 5. Use and enjoy rvm in your tcsh
# Note that this script relies on a ruby already installed in the path.
# It shouldn't be too hard to enhance it to bootstrap itself using rvm.

require 'yaml'
rvm_home="#{ENV['HOME']}/.rvm"
rvm_command="source #{rvm_home}/scripts/rvm; rvm #{ARGV.join(' ')}"
tmpfile= "/tmp/rvm#{$$}.yml"
tmpecho= "/tmp/rvm#{$$}.txt"
outcmds = ""

if ARGV[0] == "use"
  output = `bash -c \"#{rvm_command} && rvm info > #{tmpfile}\"`
  info = YAML.load(File.open(tmpfile,'r'))

  #info is a hash with a single key: the current ruby version.
  # we want the hash that is the value of that key,
  # and in that hash we want the environment hash.
  env = info.shift[1]["environment"]

  env.each do |key,val|
    next if val.empty?
    outcmds << "setenv #{key} \"#{val}\";"
  end
  # hack because ruby version is not available in 'rvm info'
  ruby_version = File.basename(env["MY_RUBY_HOME"])
  outcmds << "setenv RUBY_VERSION \"#{ruby_version}\";"
  `rm -f #{tmpfile}`
  # assume output of 'rvm use' is a single line with no special chars
  outcmds << "echo \'#{output.chomp}\'"

else
  # workaround for tcsh problem eval'ing echo commands containing special chars.
  `bash -c "#{rvm_command} > #{tmpecho}"`
  outcmds = "cat #{tmpecho}; rm #{tmpecho}"
end
puts outcmds
