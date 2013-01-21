class AddNameToItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string, :limit=>50
  end
end
