defmodule FileProxy do
  @callback read!(Path.t()) :: binary()
  @backend Application.compile_env!(:testability_using_mox, :file_backend)

  def read!(path) do
    @backend.read!(path)
  end
end
