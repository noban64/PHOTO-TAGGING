class AddTimeToScoreboard < ActiveRecord::Migration[8.0]
  def change

    change_table :scoreboards do |t|
      t.remove :score
      t.time :score
    end
  end
end
