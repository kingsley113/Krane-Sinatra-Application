ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
    set :database, 'sqlite3:db/database.db'
end

# ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require 'rack-flash'
require 'sinatra/redirect_with_flash'

require_all 'app'