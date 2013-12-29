class AddCatalogToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :catalog_id, :integer, :default => 1
  end
end
