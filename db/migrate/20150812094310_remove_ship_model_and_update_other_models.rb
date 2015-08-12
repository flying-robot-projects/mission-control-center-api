class RemoveShipModelAndUpdateOtherModels < ActiveRecord::Migration
  def change
    drop_table :ship_models

    add_column :ships, :category, :string
    remove_column :ships, :ship_model_id

    rename_column :telemetric_recordings, :flight_id, :mission_id

    rename_table :flights, :missions
  end
end
