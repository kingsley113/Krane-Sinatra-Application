class Project < ActiveRecord::Base
    has_many :daily_reports

    has_many :user_projects
    has_many :users, through: :user_projects

    include Slug
    after_validation :set_slug, only: [:create, :update]
end