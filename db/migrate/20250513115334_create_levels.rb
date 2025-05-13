class CreateLevels < ActiveRecord::Migration[8.0]
  def change
    create_table :levels do |t|
      t.integer :level_id
      t.integer :level_coordinates, array: true

      t.timestamps
    end
  end
end
