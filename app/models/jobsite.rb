class Jobsite < ActiveRecord::Base
    has_many :daily_reports

    has_many :user_jobsites
    has_many :users, through: :user_jobsites

    include Slug
    after_validation :set_slug, only: [:create, :update]
end