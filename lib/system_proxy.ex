defmodule SystemProxy do
  @callback monotonic_time(System.time_unit()) :: integer()
  @callback argv() :: [String.t()]
  @backend Application.compile_env!(:testability_using_mox, :system_backend)

  def monotonic_time(unit) do
    @backend.monotonic_time(unit)
  end

  def argv do
    @backend.argv
  end
end
