class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.column :order_id, :integer
      t.timestamps
    end
  end
end
