class AddZipToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :zip, :string, :limit=>10
  end
end
