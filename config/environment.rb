# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Soccer::Application.initialize!

Time::DATE_FORMATS[:game] = "%A, %B %e, %l:%M %p"
Time::DATE_FORMATS[:localdb] = "%Y-%m-%d %H:%M:%S"


