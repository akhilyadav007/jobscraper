class Setup
  require 'cgi'
  require 'debug' if Rails.env.development?
  require 'dotenv'
  require 'google_search_results'
  Dotenv.load

  Dir.glob(File.join(__dir__, 'engine/**/*.rb')).each do |file|
    require_relative file
  end
end
