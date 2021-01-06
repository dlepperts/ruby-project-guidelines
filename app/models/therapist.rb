class Therapist < ActiveRecord::Base
    has_many :sessions
    has_many :patients, through: :sessions
end