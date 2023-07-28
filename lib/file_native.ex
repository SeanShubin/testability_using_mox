defmodule FileNative do
  def read!(path) do
    File.read!(path)
  end
end
