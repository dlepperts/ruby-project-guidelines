class Session < ActiveRecord::Base
    belongs_to :patient
    belongs_to :therapist
end