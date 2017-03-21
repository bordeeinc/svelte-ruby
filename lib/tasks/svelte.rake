require 'FileUtils' unless Object.const_defined?('FileUtils')

# in lib/tasks/rollup.rake
CURRENT_DIR = File.expand_path(File.dirname(__FILE__))
LIB_DIR     = File.join(CURRENT_DIR, '..')

namespace :svelte do

  desc 'Rollup (transpile) svelte/* and write to lib/svelte.js (requires npm rollup)'
  task :rollup do

    # ensure remove 
    output_filename = File.join(LIB_DIR, 'svelte.js')
    rollup_config = File.join(LIB_DIR, '../config/rollup.config.ruby.js')

    # ensure remove 
    FileUtils.rm_f output_filename
    raise "ERROR: could not delete previous file in output path: #{output_filename}" if File.exist?(output_filename)

    puts "cd svelte && rollup -c ./rollup/rollup.config.ruby.js"
    puts `cd svelte && rollup -c ./rollup/rollup.config.ruby.js`

    # ensure exists
    raise "ERROR: could not find file in output path: #{output_filename}" unless File.exist?(output_filename)

    puts "svelte:rollup done: success!"
  end


  desc 'Copy `lib/rollup/rollup.config.ruby.js` to `svelte/rollup/`'
  task :copy_config do

    # ensure remove 
    output_filename = File.join(LIB_DIR, '../svelte/rollup/rollup.config.ruby.js')
    rollup_config = File.join(LIB_DIR, 'rollup/rollup.config.ruby.js')

    FileUtils.rm_f output_filename
    raise "ERROR: could not delete previous file in output path: #{output_filename}" if File.exist?(output_filename)

    FileUtils.cp(rollup_config, output_filename)

    # ensure exists
    raise "ERROR: could not find file in output path: #{output_filename}" unless File.exist?(output_filename)

    puts "rollup:copy_config_to_svelte done: success!"
  end

end
