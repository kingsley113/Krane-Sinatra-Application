require './config/environment'

class UsersController < ApplicationController

  get '/users' do
    # @users = User.all

    erb :'users/index'
    end

  get '/users/signup' do
    @jobsites = Jobsite.all
    
    # TODO: add validation to only show signup for new users

    erb :'users/signup'
  end

  get '/users/:slug' do
    @user = User.find_by(slug: params[:slug])

    erb :'users/show'
  end

  post '/users' do
    @user = User.create(params)

    redirect "/users/#{@user.slug}"
  end

end