class Project < ActiveRecord::Base
    include Slug
    has_many :daily_reports

    has_many :user_projects
    has_many :users, through: :user_projects

    after_validation :set_slug, only: [:create, :update]
end