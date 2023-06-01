class AddAddressesToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :address, :string
  end
end
