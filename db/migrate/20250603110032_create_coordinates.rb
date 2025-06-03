class CreateCoordinates < ActiveRecord::Migration[8.0]
  def change
    create_table :coordinates do |t|
      t.references :level, null: false, foreign_key: true
      t.integer :x_cord
      t.integer :y_cord
      t.integer :character_id

      t.timestamps
    end
  end
end
