class DailyReport < ActiveRecord::Base
    belongs_to :user
    belongs_to :jobsite

end