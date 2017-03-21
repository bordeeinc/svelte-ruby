require 'execjs'
require 'open-uri'
require 'svelte/version'
require 'core_ext/array/extract_options.rb' unless Array.method_defined?(:extract_options!)

module Svelte
  VERSION_JS  = '1.12.1'
  LIB_DIR     = File.expand_path(File.dirname(__FILE__))
  SOURCE_URI  = IO.read(File.join(LIB_DIR, 'svelte.js'))
  CONTEXT     = ExecJS.compile(SOURCE_URI)

  # make all class methods
  extend self

  # call method on sveltejs compiler
  #
  # @see https://github.com/sveltejs/svelte#options
  # @param method_str  [String]   svelte method
  # @param arg1        [File,URI] component file
  # @param source_uri  [File,URI] sveltejs file (optional)
  # @param args        [Hash]     sveltejs defined flags (optional)
  # @return            [Hash]     returns code and map
  def exec_method(method_str, arg1=nil, source_uri=nil, *args)
    raise "Error method is not String" unless method_str.is_a?(String)
    opts    = args.extract_options!
    context = source_uri ? ExecJS.compile(open(source_uri).read) : CONTEXT
    arg1    = open(arg1).read if (!arg1.nil? && File.exist?(arg1))

    context.call(method_str.strip, arg1, opts)
  end

  # eval code in sveltjs env 
  #
  # @param code_str     [String]   svelte code
  # @param source_uri   [File,URI] sveltejs file (optional)
  # @return             [String]
  def exec_eval(code_str, source_uri=nil)
    raise "Error code is not String" unless code_str.is_a?(String)
    context = source_uri ? ExecJS.compile(open(source_uri).read) : CONTEXT

    context.eval(code_str.strip)
  end
end
