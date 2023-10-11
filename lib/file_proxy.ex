defmodule FileProxy do
  @callback read!(Path.t()) :: binary()

  def read!(path) do
    backend().read!(path)
  end

  defp backend, do: Process.get(:file_backend) || FileNative
end
