class ModifyTables < ActiveRecord::Migration
  def change
		rename_column :matches, :match_id, :match_no
		rename_column :games, :game_id, :game_no

		change_table :pools do |t|
			t.remove :game_id, :match_id, :sell_statu
			t.belongs_to :game
			t.belongs_to :match
			t.integer :sell_status
		end
  end
end
