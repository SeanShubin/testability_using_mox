import Config

config :testability_using_mox, file_backend: FileProxy.Mock
config :testability_using_mox, io_backend: IOProxy.Mock
config :testability_using_mox, system_backend: SystemProxy.Mock
