class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
    add_index :appointments, [:doctor_id, :patient_id, :created_at]    
  end
end
	