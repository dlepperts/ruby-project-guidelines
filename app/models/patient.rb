class Patient < ActiveRecord::Base
    has_many :sessions
    has_many :therapists, through: :sessions

    def get_sessions
        self.sessions
    end

    def find_all_therapists
        Therapist.all
    end

    def find_therapists_by_location
        find_all_therapists.select{ |therapist| therapist.location == self.location}
    end

    def find_therapist_by_insurance
        find_therapists_by_location.select{ |therapist| therapist.insurance == self.insurance}
    end

end