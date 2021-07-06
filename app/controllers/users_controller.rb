require './config/environment'

class UsersController < ApplicationController
  enable :sessions
  use Rack::Flash

  # Show Users index page
  get '/users' do
    redirect_if_not_logged_in
    @users = User.all 
    erb :'users/index'
  end

  # Create new user
  get '/users/signup' do
    @projects = Project.all
    
    if logged_in?
      redirect "/users/#{current_user.slug}"
    end

    erb :'users/signup'
  end

  post '/users' do
    if User.find_by(username: params[:new_user][:username]) 
      session[:message] = "Username is already taken, please try another"
      redirect "/users/signup"
    end
    @user = User.create(params[:new_user].except("project_ids"))

    params[:new_user][:project_ids].each do |project|
      @user.projects << Project.find(project)
    end

    redirect "/users/#{@user.slug}"
  end

  # Show single user details page
  get '/users/:slug' do
    redirect_if_not_logged_in
    @user = User.find_by(slug: params[:slug])

    erb :'users/show'
  end

  # Edit User
  get '/users/:slug/edit' do
    @user = User.find_by(slug: params[:slug])
    @projects = Project.all

    erb :'users/edit'
  end

  patch '/users/:slug' do
    @current_user = current_user
    @user = User.find_by(slug: params[:slug])

    if @current_user && @user.authenticate(params[:edited_user][:old_password]) 
      # update general attributes
      (params[:edited_user].except("old_password", "password")).each do |attribute, value|
        if attribute == "project_ids"
          @user.projects = []
          params[:edited_user][:project_ids].each do |project|
            @user.projects << Project.find(project)
          end
        else
          @user[:"#{attribute}"] = value
        end
      end
    
      # reset and update password
      @user.password_digest = nil
      @user.password = params[:edited_user][:password]

      @user.save
    else
      session[:message] = "Incorrect Password, try again."
      redirect "/users/#{@user.slug}/edit"
    end
    
    session[:message] = "Successfully updated user info"
    redirect "/users/#{@user.slug}"
  end

  # Delete User
  delete "/users/:slug" do
    @user = User.find_by(slug: params[:slug])

    if @user = current_user
      @user.delete
    end
  end

  # User Login page
  get '/login' do
    if logged_in?
      redirect "/users/#{current_user.slug}"
    end

    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      redirect "/"
    end

    erb :'/users/failure'
  end

  # User Logout
  get '/logout' do
    session.clear
    redirect '/login'
  end
end