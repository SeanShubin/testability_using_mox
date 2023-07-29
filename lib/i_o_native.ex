defmodule IONative do
  @behaviour IOProxy
  def puts(arg) do
    IO.puts(arg)
  end
end
