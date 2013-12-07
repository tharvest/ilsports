class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.datetime :starttime
      t.datetime :endtime
      t.integer :quota
      t.integer :signed
      t.string :place
      t.string :organizer
      t.string :contact
      t.text :description
      t.string :other

      t.timestamps
    end
  end
end
