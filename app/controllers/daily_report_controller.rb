require './config/environment'

class ApplicationController < Sinatra::Base

    get '/daily_reports' do
        # @daily_reports = DailyReport.all
        "this is the daily report index"
        erb :'/daily_reports/index'
    end

    get '/daily_reports/new' do
        erb :'/daily_reports/new'
    end

    get '/daily_reports/:id' do
        erb :'daily_reports/show'
    end

    post '/daily_reports' do
        
    end
end
