class CreatePatients < ActiveRecord::Migration[5.2]
    def change
      create_table :patients do |t|
        t.string :chosen_name
        t.string :location
        t.string :phone_number
        t.string :email
      end
    end
  end