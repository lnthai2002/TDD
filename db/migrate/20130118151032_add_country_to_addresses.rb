class AddCountryToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :country, :string, :limit=>50
  end
end
