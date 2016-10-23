# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(admin/admin.scss  admin/admin.js jquery.raty.js jquery.min.js bootstrap.min.js owl.carousel.min.js jquery.sticky.js jquery.easing.1.3.min.js main.js bxslider.min.js script.slider.js bootstrap.min.css font-awesome.min.css owl.carousel.css style.css responsive.css)
