gem "minitest"
require 'minitest/spec'
require "minitest/autorun"
require "svelte"

class TestSvelte < Minitest::Test
  def setup
    @files                    = File.join(File.expand_path(File.dirname(__FILE__)), "files")
    @hello_world_filename     = File.join(@files, 'hello_world.html')
    @hello_world_output       = IO.read(File.join(@files, 'hello_world_output.txt'))
    @hello_world_output_iife  = IO.read(File.join(@files, 'hello_world_output_iife.txt'))
  end

  def test_version
    exp = "1.12.1"
    act = Svelte.exec_eval('svelte.VERSION')
    assert_equal exp, act
  end

  def test_compile_with_string
    exp = @hello_world_output
    act = Svelte.exec_method('svelte.compile', '<h1>Hello {{name}}</h1>')
    assert_kind_of Hash, act
    assert_equal exp, act['code']
  end

  def test_compile_with_file
    exp = @hello_world_output
    act = Svelte.exec_method('svelte.compile', @hello_world_filename)
    assert_kind_of Hash, act
    assert_equal exp, act['code']
  end

  def test_compile_with_file_and_args_iife
    exp = @hello_world_output_iife
    act = Svelte.exec_method('svelte.compile', @hello_world_filename, nil, format: 'iife', name: 'SvelteComponent')

    # generate test output
    #IO.write(File.join(@files,'hello_world_output_iife.txt'), act['code'])

    assert_kind_of Hash, act
    assert_equal exp, act['code']
  end
end
