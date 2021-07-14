require './config/environment'

class ProjectsController < ApplicationController
	enable :sessions
	use Rack::Flash

	# Show Projects Index Page
	get '/projects' do
		redirect_if_not_logged_in
		@projects = Project.all
		
		erb :'projects/index'
	end

	# Create new Project
	get '/projects/new' do
		redirect_if_not_logged_in
		redirect_if_not_admin
		@users = User.all
		

		erb :'projects/new'
	end

	post '/projects' do
		@project = Project.create(params[:new_project].except("user_ids"))

		if params[:new_project].include?("user_ids")
			params[:new_project][:user_ids].each do |user|
			@project.users << User.find(user)
			end
		end

		redirect "/projects/#{@project.slug}"
	end

	# Show project detail page
	get '/projects/:slug' do
		redirect_if_not_logged_in
		@project = Project.find_by(slug: params[:slug])
		
		erb :'projects/show'
	end

	# Update a project
	get '/projects/:slug/edit' do
		redirect_if_not_logged_in
		@project = Project.find_by(slug: params[:slug])
		@users = User.all

		erb :'projects/edit'
	end
  
	patch '/projects/:slug' do
		@project = Project.find_by(slug: params[:slug])

		if params[:edit_project].include?("user_ids")
			params[:edit_project].except("user_ids").each do |attribute, value|
				@project[:"#{attribute}"] = value
			end
		
			@project.users = [] 
			params[:edit_project][:user_ids].each do |user_id|
				@project.users << User.find(user_id)
			end
		end
		@project.save

		redirect "/projects/#{@project.slug}"
	end
  
	# Delete a project
	delete '/project/:slug' do
		redirect_if_not_logged_in
		@project = Project.find_by(slug: params[:slug])
		@project.delete

		redirect '/projects'
	end
end