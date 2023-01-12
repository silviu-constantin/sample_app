class AddMenuToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :menu, :text
  end
end
