class User < ActiveRecord::Base
    include Slug
    has_secure_password

    has_many :daily_reports

    has_many :user_projects
    has_many :projects, through: :user_projects

    after_validation :set_slug, only: [:create, :update]
end