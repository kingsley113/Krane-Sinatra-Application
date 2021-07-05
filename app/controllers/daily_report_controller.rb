require './config/environment'

class DailyReportsController < ApplicationController
	enable :sessions

	# Show Daily Reports Index
	get '/daily_reports' do
		redirect_if_not_logged_in
		@daily_reports = DailyReport.all
		@projects = Project.all

		erb :'daily_reports/index'
	end

	# Create Daily Report
	get '/daily_reports/new' do
		redirect_if_not_logged_in

		@user = current_user 
		@projects = Project.all

		erb :'daily_reports/new'
	end

	post '/daily_reports' do
		@daily_report = DailyReport.create(params[:daily_report])

		if @daily_report.save
			redirect "/daily_reports/#{@daily_report.id}"
		else
			session[:message] = "Please fill out all required fields."
			redirect '/daily_reports/new'
		end
	end

	# Show single Daily Report
	get '/daily_reports/:id' do
		redirect_if_not_logged_in
		@daily_report = DailyReport.find(params[:id])

		erb :'daily_reports/show'
	end

	# Update Daily Report
	get '/daily_reports/:id/edit' do
		redirect_if_not_logged_in
		@daily_report = DailyReport.find(params[:id])
		@projects = Project.all
		@user = current_user

		if @daily_report.user = current_user
			erb :'daily_reports/edit'
		end
	end

	patch '/daily_reports/:id' do
		@daily_report = DailyReport.find(params[:id])

		@daily_report.update(params[:daily_report])
		if @daily_report.save
			session[:message] = "Report edited successfully."
			redirect "/daily_reports/#{@daily_report.id}"
		else
			session[:message] = "Please fill out all required fields."
			redirect "/daily_reports/#{@daily_report.id}/edit"
		end
	end

	# Delete Daily Report
	delete '/daily_reports/:id' do
		@daily_report = DailyReport.find(params[:id])
		if @daily_report.user = current_user
				@daily_report.delete
		end
		redirect '/daily_reports'
	end
end
