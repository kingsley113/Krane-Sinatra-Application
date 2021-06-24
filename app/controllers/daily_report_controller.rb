require './config/environment'

class ApplicationController < Sinatra::Base

    get '/daily_reports' do
        # @daily_reports = DailyReport.all
        # "this is the daily report index"
        erb :'daily_reports/index'
    end

    get '/daily_reports/new' do
        erb :'daily_reports/new'
    end

    get '/daily_reports/:id' do
        erb :'daily_reports/show'
    end

    post '/daily_reports' do
        
    end

    get '/daily_reports/:id/edit' do
        erb :'daily_reports/edit'
    end
 
    post '/daily_reports/:id' do
        @daily_report = [] 
        redirect "/daily_reports/#{@daily_report.id}"
        # erb :'daily_reports/show'
    end

    delete '/daily_reports/:id' do
        redirect '/daily_reports'
    end
end
