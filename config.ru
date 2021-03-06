require './config/environment'

begin

  use Rack::MethodOverride
  use DailyReportsController
  use ProjectsController
  use UsersController
  run ApplicationController
  
rescue ActiveRecord::PendingMigrationError => err
    STDERR.puts err
    exit 1
end