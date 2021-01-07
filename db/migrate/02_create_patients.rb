class CreatePatients < ActiveRecord::Migration[5.2]
    def change
      create_table :patients do |t|
        t.string :username
        t.string :chosen_name
        t.string :location
        t.string :phone_number
        t.string :email
        
        t.string :gender_id
        t.string :sexual_id
        t.string :sex_at_birth
        t.string :race
        t.string :age

        t.string :insurance
      end
    end
  end