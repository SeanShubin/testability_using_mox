defmodule IOProxy do
  @callback puts(IO.chardata() | String.Chars.t()) :: :ok
  @backend Application.compile_env!(:testability_using_mox, :io_backend)

  def puts(item) do
    @backend.puts(item)
  end
end
