# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')


# Enable serving of images, stylesheets, and JavaScripts from an asset server.
Rails.application.config.action_controller.asset_host = ENV['CDN_HOST'] if ENV['CDN_HOST'] 

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( application.css )
JAVASCRIPT_URL = ENV.fetch('JS_URL'){'http://chase-childers.s3.us-east-2.amazonaws.com/assets/application.js'}
CSS_URL = ENV.fetch('CSS_URL'){'http://chase-childers.s3.us-east-2.amazonaws.com/assets/welcome.css'}