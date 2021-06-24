require './config/environment'

begin

  use Rack::MethodOverride
  run ApplicationController
  use DailyReportsController
  use JobsitesController
  use UsersController
  
end