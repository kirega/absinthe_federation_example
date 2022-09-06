import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :absinthe_federation_example, AbsintheFederationExample.Repo,
  username: System.get_env("DATABASE_USER") || "postgres",
  password: System.get_env("DATABASE_PASS") || "postgres",
  hostname: System.get_env("DATABASE_HOST") || "localhost",
  database: System.get_env("DATABASE_DB") || "app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :absinthe_federation_example, AbsintheFederationExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "xs6m8k2vVMtbSa4+eoZjJW5yZjFQNh4kcjnPcoZAacB0u1GRoakGatyZni3q59cq",
  server: false

# In test we don't send emails.
config :phoenix_container_example, PhoenixContainerExample.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger,
  level: :warn,
  metadata: [:file, :line]

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :junit_formatter,
  # report_file: "test-junit-report.xml",
  # report_dir: "/tmp",
  report_dir: "#{Mix.Project.build_path()}/junit-reports",
  # report_dir: "junit-reports",
  automatic_create_dir?: true,
  print_report_file: true,
  # prepend_project_name?: true,
  include_filename?: true,
  include_file_line?: true
