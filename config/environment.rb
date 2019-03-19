ENV['SINATRA_ENV'] ||= "development"
SINATRA_ACTIVESUPPORT_WARNING=false

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
Dotenv.load

set :database_file, "./database.yml"

require './app/controllers/application_controller'
require_all 'app'
