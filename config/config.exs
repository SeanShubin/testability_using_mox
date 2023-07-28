import Config

config :testability_using_mox, file_backend: FileNative
config :testability_using_mox, io_backend: IONative
config :testability_using_mox, system_backend: SystemNative

if Mix.env() == :test do
  import_config("test.exs")
end
