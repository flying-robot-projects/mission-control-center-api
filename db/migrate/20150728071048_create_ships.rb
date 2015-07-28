class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.integer :ship_model_id
      t.string :status

      t.timestamps null: false
    end
  end
end
