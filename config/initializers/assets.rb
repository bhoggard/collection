# Be sure to restart your server when you modify this file.

config = Rails.application.config
# Version of your assets, change this if you want to expire all your assets.
config.assets.version = '1.0'

# Add additional assets to the asset load path
config.assets.precompile << 'filterrific/filterrific-spinner.gif'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder
# are already added.
# Rails.application.config.assets.precompile += %w( search.js )
