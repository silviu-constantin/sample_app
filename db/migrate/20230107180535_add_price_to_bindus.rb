class AddPriceToBindus < ActiveRecord::Migration[6.1]
  def change
    add_column :bindus, :price, :integer
  end
end
