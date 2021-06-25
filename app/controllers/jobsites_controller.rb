require './config/environment'

class JobsitesController < ApplicationController

	get '/jobsites' do
		@jobsites = Jobsite.all

		erb :'jobsites/index'
	end

	get '/jobsites/new' do
		@users = User.all
		erb :'jobsite/new'
	end

	get '/jobsites/:slug' do
		@jobsite = Jobsite.find_by(slug: params[:slug])
		erb :'jobsites/show'
	end

	post '/jobsites' do
		@jobsite = Jobsite.create(params[:new_jobsite].except("user_ids"))

		params[:new_jobsite][:user_ids].each do |user|
		@jobsite.users << User.find(user)
		end

		redirect "/jobsite/#{@jobsite.slug}"
	end



end