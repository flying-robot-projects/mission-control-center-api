class CreateShipModels < ActiveRecord::Migration
  def change
    create_table :ship_models do |t|
      t.string :name
      t.string :category

      t.timestamps null: false
    end
  end
end
