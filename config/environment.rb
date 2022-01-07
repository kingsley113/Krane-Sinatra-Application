ENV['SINATRA_ENV'] ||= "development"

require 'rack-flash'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# configure :development do
#     set :database, 'sqlite3:db/database.db'
# end

configure :development do
	set :database, 'postgresql:db/database.db'
end

# ActiveRecord::Base.establish_connection(
#     :adapter => "sqlite3",
#     :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:database => "db/#{ENV['SINATRA_ENV']}"
)

require_all 'app'