class CreateScores < ActiveRecord::Migration[8.0]
  def change
    create_table :scores do |t|
      t.string :player_name
      t.interval :player_score

      t.timestamps
    end
  end
end
