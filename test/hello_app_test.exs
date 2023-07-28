defmodule HelloAppTest do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  test "say hello to world" do
    IOProxy.Mock
    |> expect(:puts, 1, fn string ->
      assert string == "Hello, world!"
      :ok
    end)
    |> expect(:puts, 1, fn string ->
      assert string == "Took 234 microseconds"
      :ok
    end)

    FileProxy.Mock
    |> expect(:read!, 1, fn path ->
      assert path == "greeting-target.txt"
      "world"
    end)

    SystemProxy.Mock
    |> expect(:argv, 1, fn -> ["greeting-target.txt"] end)
    |> expect(:monotonic_time, 1, fn _unit -> 1000 end)
    |> expect(:monotonic_time, 1, fn _unit -> 1234 end)

    HelloApp.main()
  end
end
