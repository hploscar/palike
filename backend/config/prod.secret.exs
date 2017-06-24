use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :palike, Palike.Endpoint,
  secret_key_base: "vnq4tlflsaSvXFp2Zhjji/ijcEtrJIVBl18y4/EHbLP0mEI8Hj7fEpTOJ8qx1BUJ"

# Configure your database
config :palike, Palike.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "palike_prod",
  pool_size: 15
