class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.column :state, :string
      t.timestamps
    end
  end
end
