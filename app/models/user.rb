class User < ActiveRecord::Base
    has_many :daily_reports

    has_many :user_jobsites
    has_many :jobsites, through: :user_jobsites

    has_secure_password

    include Slug
    after_validation :set_slug, only: [:create, :update]
end