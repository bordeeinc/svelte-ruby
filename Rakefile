# -*- ruby -*-

require "rubygems"
require "hoe"
require './lib/svelte/version.rb'

Hoe.plugin :gemspec
Hoe.plugin :minitest
Hoe.plugin :yard
Hoe.plugin :bundler
Hoe.plugin :git
Hoe.plugin :ignore

Hoe.spec "svelte" do
  developer("So Awesome Man", "callme@1800aweso.me")
  license "MIT" # this should match the license in the README

  self.name                 = 'svelte-ruby'
  self.version              = Svelte::VERSION
  self.summary              = 'Ruby Gem wrapper for the Svelte compiler'
  self.email                = 'support@bordee.com'
  self.description          = self.summary
  self.urls                 = ['https://github.com/bordeeinc/svelte-ruby']
  self.testlib              = :minitest
  self.readme_file          = 'README.md'
  self.history_file         = 'History.txt'

  # third-party
  self.yard_title           = self.name
  self.yard_markup          = 'markdown'
  #self.exclude              = Hoe::DEFAULT_CONFIG["exclude"] = /tmp$|CVS|TAGS|\.(svn|git|DS_Store)/

  self.extra_deps += [
    ['execjs',                     '2.7.0']
  ]

  self.extra_dev_deps += [
    ["hoe-bundler",               ">= 1.2"],
    ["hoe-gemspec",               ">= 1.0"],
    ["hoe-git",                   ">= 1.6"],
    ["minitest",                  "~> 5.9.0"],
    ["yard",                      "~> 0.8"],
    ["redcarpet",                 "~> 3.3"] # yard/markdown
  ]

  self.clean_globs += [
    '.yardoc',
    'vendor',
    'Gemfile.lock',
    '.bundle',
  ]

  self.spec_extras = {
    :required_ruby_version => '>= 1.9.2'
  }
end

# require rake tasks
current_dir = File.expand_path(File.dirname(__FILE__))
Dir.glob(File.join(current_dir, 'lib/tasks/*.rake')).each {|r| import r} 

# vim: syntax=ruby
