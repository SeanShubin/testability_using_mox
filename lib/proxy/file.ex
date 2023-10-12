defmodule Proxy.File do
  @callback read!(Path.t()) :: binary()

  def read!(path) do
    backend().read!(path)
  end

  defp backend, do: Process.get(:file_backend) || File
end
