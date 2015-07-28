class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :ship_id
      t.string :status
      t.json :telemetric_recordings

      t.timestamps null: false
    end
  end
end
