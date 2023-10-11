defmodule IOProxy do
  @callback puts(IO.chardata() | String.Chars.t()) :: :ok

  def puts(item) do
    backend().puts(item)
  end

  defp backend, do: Process.get(:io_backend) || IONative
end
