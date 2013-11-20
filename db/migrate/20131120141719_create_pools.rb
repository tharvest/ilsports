class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.integer :game_id
      t.string :match_id
      t.datetime :create_time
      t.integer :sell_statu
      t.integer :match_result

      t.timestamps
    end
  end
end
