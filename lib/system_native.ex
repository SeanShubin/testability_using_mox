defmodule SystemNative do
  def monotonic_time(unit) do
    System.monotonic_time(unit)
  end

  def argv do
    System.argv
  end
end
