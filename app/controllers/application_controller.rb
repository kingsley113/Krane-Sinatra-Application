require './config/environment'
require 'time'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "constructioniscool"
  end

  # Index Page 
  get '/' do 
      erb :index
  end

  # Helper methods
  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        session[:message] = 'You have to be logged in to do that'
        redirect "/login"
      end
    end

		def redirect_if_not_admin
			if !current_user.admin
				session[:message] = 'You need to be an admin to do that'
				redirect "/"
			end
		end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end