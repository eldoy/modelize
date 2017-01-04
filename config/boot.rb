require 'bundler/setup'
Bundler.require(:default, :development)

MODE = ENV['RACK_ENV'] || 'development'

require './lib/modelize.rb'
require './models/model.rb'
require './models/flat.rb'

# Connect to DB
Minimongo.db = Mongo::Client.new(['127.0.0.1:27017'], :database => "modelize_#{MODE}")

include Minimongo::Query
