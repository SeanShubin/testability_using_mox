defmodule Proxy.System do
  @callback monotonic_time(System.time_unit()) :: integer()
  @callback argv() :: [String.t()]

  def monotonic_time(unit) do
    backend().monotonic_time(unit)
  end

  def argv do
    backend().argv
  end

  defp backend, do: Process.get(:system_backend) || System
end
