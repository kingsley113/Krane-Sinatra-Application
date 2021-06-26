require './config/environment'

class DailyReportsController < ApplicationController
	enable :sessions
	use Rack::Flash

	get '/daily_reports' do
		redirect_if_not_logged_in
		@daily_reports = DailyReport.all
		
		erb :'daily_reports/index'
	end

	get '/daily_reports/new' do
		redirect_if_not_logged_in

		@user = current_user 
		@projects = Project.all

		erb :'daily_reports/new'
	end

	get '/daily_reports/:id' do
		redirect_if_not_logged_in

		erb :'daily_reports/show'
	end

	post '/daily_reports' do
		@daily_report = DailyReport.create(params[:daily_report])

		redirect "/daily_reports/#{@daily_report.id}"
	end

	get '/daily_reports/:id/edit' do
		redirect_if_not_logged_in
		@daily_report = DailyReport.find(params[:id])

		if @daily_report.user = current_user
			erb :'daily_reports/edit'
		end
	end

	patch '/daily_reports/:id' do
		@daily_report = DailyReport.find(params[:id])

		params[:daily_report].each do |attribute, value|
			@daily_report[:"#{attribute}"] = value
		end
		daily_report.save

		redirect "/daily_reports/#{@daily_report.id}"
	end

	delete '/daily_reports/:id' do
		@daily_report = DailyReport.find(params[:id])
		if @daily_report.user = current_user
				@daily_report.delete
		end
		redirect '/daily_reports'
	end
end
