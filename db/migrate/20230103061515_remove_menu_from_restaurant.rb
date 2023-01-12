class RemoveMenuFromRestaurant < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :menu, :string
  end
end
