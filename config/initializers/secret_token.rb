# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Akanodemo::Application.config.secret_key_base = ENV['SECRET_KEY_BASE']
#Akanodemo::Application.config.secret_token = ENV['SECRET_TOKEN']
Akanodemo::Application.config.secret_key_base = "ed795c004a50389c9d3c8acbc983d29169e4c51c479df9babd0d41ae9fa24520b4df1b4e22c25a6ccdb7b63ee936dbc276faa614b84146a588dc37dc5ce9135e"
Akanodemo::Application.config.secret_token = 'f631ef633f38a8be1eb5f54cc4716d41ce6a82f22bbeca7e51865a0170302e0a3edc163b993f776e6f02e4cced8d1dc15c77a58130cd10f6342c58003dfa89b2'
