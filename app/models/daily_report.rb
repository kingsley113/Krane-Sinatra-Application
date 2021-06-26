class DailyReport < ActiveRecord::Base
    belongs_to :user
    belongs_to :project

    # validates :work_date, 
    # :no_of_workers_onsite,
    # :shift_start_time,
    # :shift_end_time,
    # :work_completed,
    # :weather,
    # :deliveries,
    # :inspections,
    # :project_id,
    # :user_id,
    # presence: true

end