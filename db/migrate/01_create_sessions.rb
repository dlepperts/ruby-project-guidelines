class CreateSessions < ActiveRecord::Migration[5.2]
    def change
      create_table :sessions do |t|
        t.string :date 
        t.integer :patient_id
        t.integer :therapist_id
        t.boolean :completed
      end
    end
  end