import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tls, TlsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3IXM6S+dohg39WV1n5U9p+Ezc8Kg4Y2q7av2O5CtZQsg1AVtrqhdaZlraxJP8nxR",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
