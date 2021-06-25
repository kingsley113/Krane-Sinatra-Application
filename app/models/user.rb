class User < ActiveRecord::Base
    has_many :daily_reports

    has_many :user_projects
    has_many :projects, through: :user_projects

    has_secure_password

    include Slug
    after_validation :set_slug, only: [:create, :update]
end