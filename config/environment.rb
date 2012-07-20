# Load the rails application
require "paperclip"
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!
Paperclip.options[:command_path] = "C:\Program Files\ImageMagick-6.5.6-Q8"
