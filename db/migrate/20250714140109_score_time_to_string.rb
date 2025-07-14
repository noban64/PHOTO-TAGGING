class ScoreTimeToString < ActiveRecord::Migration[8.0]
  def change
    change_table :scoreboards do |t|
      t.remove :score
      t.string :score
    end
  end
end
