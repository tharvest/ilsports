class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :match_id
      t.string :player_a
      t.string :player_b
      t.datetime :start_time
      t.datetime :end_time
      t.integer :operator

      t.timestamps
    end
  end
end
