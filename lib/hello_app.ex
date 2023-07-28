defmodule HelloApp do
  def main do
    time_unit = :microsecond
    microseconds_before = SystemProxy.monotonic_time time_unit
    target = SystemProxy.argv |> List.first |> FileProxy.read!
    IOProxy.puts "Hello, #{target}!"
    microseconds_after = SystemProxy.monotonic_time time_unit
    microseconds_duration = microseconds_after - microseconds_before
    IOProxy.puts "Took #{microseconds_duration} microseconds"
  end
end
