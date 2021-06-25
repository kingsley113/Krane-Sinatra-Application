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

	get '/projects/:slug/edit' do
		@project = Project.find_by(slug: params[:slug])
		@users = User.all

		erb :'projects/show'
	end
  # TODO: patch Edit
	patch '/projects/:slug' do
		@project = Project.find_by(slug: params[:slug])

		params[:project].except("user_ids").each do |attribute, value|
			@project[:"#{attribute}"] = value
		end

		@project[:user_ids] = [] 
		params[:user_ids].each do |user|
			@project[:user_ids] << User.find(user.id)
		end

		@project.save

		redirect "/projects/#{@project.slug}"
	end
  # TODO: delete 

end