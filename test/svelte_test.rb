require "test_helper"

class TestSvelte < Minitest::Test
  def setup
    @files                    = File.join(File.expand_path(File.dirname(__FILE__)), "files")
    @hello_world_filename     = File.join(@files, 'hello_world.html')
    @hello_world_output       = IO.read(File.join(@files, 'hello_world_output.txt'))
  end

  def test_version
    exp = "3.38.2"
    act = Svelte.exec_eval("svelte.VERSION")
    assert_equal exp, act
  end

  def test_compile_with_string
    exp = @hello_world_output
    act = Svelte.exec_method("svelte.compile", "<style>h1 { color: pink; }</style><h1>Hello {{name}}</h1>", nil, name: "SvelteComponent")

    # generate test output
    # IO.write(File.join(@files,'hello_world_output.txt'), act["js"]["code"])

    assert_kind_of Hash, act
    assert_equal exp, act["js"]["code"]
  end

  def test_compile_with_file
    exp = @hello_world_output
    act = Svelte.exec_method('svelte.compile', @hello_world_filename, nil, name: "SvelteComponent")

    assert_kind_of Hash, act
    assert_equal exp, act["js"]["code"]
  end
end
