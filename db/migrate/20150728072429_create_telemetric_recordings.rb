class CreateTelemetricRecordings < ActiveRecord::Migration
  def change
    create_table :telemetric_recordings do |t|
      t.integer :flight_id
      t.json :data

      t.timestamps null: false
    end
  end
end
