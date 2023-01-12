class AddDishToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :dish, :text
  end
end
