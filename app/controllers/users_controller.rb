require './config/environment'

class UsersController < Sinatra::Base

  get '/users' do
    @users = User.all

    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
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