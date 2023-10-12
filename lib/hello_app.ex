
defmodule HelloApp do
  def main do
    time_unit = :microsecond
    microseconds_before = Proxy.System.monotonic_time time_unit
    target = Proxy.System.argv |> List.first |> Proxy.File.read!
    Proxy.IO.puts "Hello, #{target}!"
    microseconds_after = Proxy.System.monotonic_time time_unit
    microseconds_duration = microseconds_after - microseconds_before
    Proxy.IO.puts "Took #{microseconds_duration} microseconds"
  end
end
