class CreateTherapists < ActiveRecord::Migration[5.2]
    def change
      create_table :therapists do |t|
        t.string :username
        t.string :chosen_name
        t.string :location
        t.string :phone_number
        t.string :email
       
        t.string :gender_id
        t.string :sexual_id
        t.string :sex_at_birth
        t.string :race
        t.integer :age

        t.boolean :lcpc
        t.boolean :lcp
        t.boolean :lmhc
        t.boolean :mft
        t.boolean :lcsw
        t.boolean :cmhimp

        t.string :education

        t.string :insurance

      end
    end
  end