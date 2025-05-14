class CreateScoreboards < ActiveRecord::Migration[8.0]
  def change
    create_table :scoreboards do |t|
      t.integer :level_id
      t.string :player_name
      t.integer :score
      t.timestamps
    end
  end
end
