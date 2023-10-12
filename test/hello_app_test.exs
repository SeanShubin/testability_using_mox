defmodule HelloAppTest do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  test "say hello to world" do
    Process.put(:io_backend, Proxy.IO.Mock)
    Process.put(:file_backend, Proxy.File.Mock)
    Process.put(:system_backend, Proxy.System.Mock)

    Proxy.IO.Mock
    |> expect(:puts, 1, fn string ->
      assert string == "Hello, world!"
      :ok
    end)
    |> expect(:puts, 1, fn string ->
      assert string == "Took 234 microseconds"
      :ok
    end)

    Proxy.File.Mock
    |> expect(:read!, 1, fn path ->
      assert path == "greeting-target.txt"
      "world"
    end)

    Proxy.System.Mock
    |> expect(:argv, 1, fn -> ["greeting-target.txt"] end)
    |> expect(:monotonic_time, 1, fn _unit -> 1000 end)
    |> expect(:monotonic_time, 1, fn _unit -> 1234 end)

    :timer.sleep(1)
    HelloApp.main()
  end
end
