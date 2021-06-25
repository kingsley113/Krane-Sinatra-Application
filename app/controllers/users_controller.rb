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
    # binding.pry
    # TODO: add verification all entries are good
    @user = User.create(params[:new_user].except("jobsite_ids"))

    params[:new_user][:jobsite_ids].each do |jobsite|
      @user.jobsites << Jobsite.find(jobsite)
    end

    redirect "/users/#{@user.slug}"
  end


  # TODO: get Edit

  # TODO: patch Edit

  # TODO: delete 
end