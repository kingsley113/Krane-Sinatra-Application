require './config/environment'
require 'sinatra/activerecord/rake'

task :console do
	Pry.start
end
  
namespace :db do
	desc 'Drop, create, migrate then seed the development database'
	task reseed: [ 'db:drop', 'db:create', 'db:migrate', 'db:seed' ] do
		puts 'Reseeding completed.'
	end
end