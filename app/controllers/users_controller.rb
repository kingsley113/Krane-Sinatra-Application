require './config/environment'

class UsersController < ApplicationController

  get '/users' do
    # @users = User.all

    erb :'users/index'
    end

  get '/users/signup' do
    @projects = Project.all
    
    # TODO: add validation to only show signup for new users

    erb :'users/signup'
  end

  get '/users/:slug' do
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

  # TODO: get login
  
  # TODO: post login

  # TODO: get Edit

  # TODO: patch Edit

  # TODO: delete 
end