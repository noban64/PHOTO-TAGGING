class ScoreToTime < ActiveRecord::Migration[8.0]
  def change

    change_table :scoreboards do |t|
      t.remove :score
      t.date :score
    end
  end
end
