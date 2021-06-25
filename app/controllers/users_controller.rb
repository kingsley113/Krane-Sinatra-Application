require './config/environment'

class UsersController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/users' do
    redirect_if_not_logged_in
    @users = User.all 
    erb :'users/index'
  end

  get '/users/signup' do
    @projects = Project.all
    
    # TODO: add validation to only show signup for new users

    erb :'users/signup'
  end

  get '/users/:slug' do
    redirect_if_not_logged_in
    @user = User.find_by(slug: params[:slug])

    erb :'users/show'
  end

  post '/users' do
    # binding.pry
    # TODO: add verification all entries are good
    @user = User.create(params[:new_user].except("project_ids"))

    params[:new_user][:project_ids].each do |project|
      @user.projects << Project.find(project)
    end

    redirect "/users/#{@user.slug}"
  end

  
  get '/login' do
    # TODO: looged in validation
    
    # binding.pry
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    end
    erb :'/users/failure'

  end

  # TODO: get Edit
  get '/users/:slug/edit' do
    @user = User.find_by(slug: params[:slug])
    @projects = Project.all

    erb :'users/edit'
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  # TODO: patch Edit

  # TODO: delete 
end