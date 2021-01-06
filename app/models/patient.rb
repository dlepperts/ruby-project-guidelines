class Patient < ActiveRecord::Base
    has_many :sessions
    has_many :therapists, through: :sessions

    def get_sessions
        self.sessions
    end
end