class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :designation
      t.integer :timing

      t.timestamps
    end
  end
end
