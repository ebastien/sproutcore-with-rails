# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

# It seems Rails does not understand MIME parameters yet
Mime::Type.register 'application/vnd.dsim+json;version=1', :dsim
