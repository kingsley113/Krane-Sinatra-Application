require './config/environment'

class ProjectsController < ApplicationController

	get '/projects' do
		@projects = Project.all

		erb :'projects/index'
	end

	get '/projects/new' do
		@users = User.all
		erb :'projects/new'
	end

	get '/projects/:slug' do
		@project = Project.find_by(slug: params[:slug])
		erb :'projects/show'
	end

	post '/projects' do
		@project = Project.create(params[:new_projects].except("user_ids"))

		params[:new_projects][:user_ids].each do |user|
		@project.users << User.find(user)
		end

		redirect "/projects/#{@project.slug}"
	end



end