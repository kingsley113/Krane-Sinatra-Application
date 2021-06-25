require './config/environment'

class ProjectsController < ApplicationController

	get '/projects' do
		@projects = Project.all
		# TODO: add login validation
		erb :'projects/index'
	end

	get '/projects/new' do
		@users = User.all
		# TODO: add login validation
		erb :'projects/new'
	end

	get '/projects/:slug' do
		@project = Project.find_by(slug: params[:slug])
		# TODO: add validation
		erb :'projects/show'
	end

	post '/projects' do
		binding.pry
		@project = Project.create(params[:new_projects].except("user_ids"))
		# TODO: add validation
		params[:new_projects][:user_ids].each do |user|
		@project.users << User.find(user)
		end

		redirect "/projects/#{@project.slug}"
	end

	get '/projects/:slug/edit' do
		@project = Project.find_by(slug: params[:slug])
		@users = User.all
		# TODO: add validation
		erb :'projects/show'
	end
  
	patch '/projects/:slug' do
		@project = Project.find_by(slug: params[:slug])
		# TODO: add validation
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
  
	delete '/project/:slug' do
		@project = Project.find_by(slug: params[:slug])
		# TODO: add validation
		@project.delete
		redirect '/projects'
	end
end