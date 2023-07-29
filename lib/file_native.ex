defmodule FileNative do
  @behaviour FileProxy
  def read!(path) do
    File.read!(path)
  end
end
