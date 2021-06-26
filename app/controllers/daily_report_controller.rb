require './config/environment'

class DailyReportsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/daily_reports' do
        @daily_reports = DailyReport.all
        # "this is the daily report index"
        # TODO: add login validation
        erb :'daily_reports/index'
    end

    get '/daily_reports/new' do
        # @user = User.find(session[:id])
        @user = User.find(1) # use this for now until login is working
        # @users = User.all
        @projects = Project.all
        # TODO: add login validation
        erb :'daily_reports/new'
    end

    get '/daily_reports/:id' do
        
        # TODO: add login validation
        erb :'daily_reports/show'
    end

    post '/daily_reports' do
        # TODO: add validation
        binding.pry
        daily_report = DailyReport.new
        params[:daily_report].each do |attribute, value|
            daily_report[:"#{attribute}"] = value
        end
        daily_report.save
    end

    get '/daily_reports/:id/edit' do
        @daily_report = DailyReport.find(params[:id])

        # TODO: add login and user validation

        erb :'daily_reports/edit'
    end
 
    post '/daily_reports/:id' do
        # TODO: add validation
        
        @daily_report = DailyReport.find(params[:id])

        params[:daily_report].each do |attribute, value|
            daily_report[:"#{attribute}"] = value
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
end
