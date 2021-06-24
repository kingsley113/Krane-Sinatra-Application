require './config/environment'

class ApplicationController < Sinatra::Base

    get '/daily_reports' do
        # @daily_reports = DailyReport.all
        "this is the daily report index"
        erb :'/daily_reports/index'
    end
end
