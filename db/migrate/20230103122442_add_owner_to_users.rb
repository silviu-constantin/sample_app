class AddOwnerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :owner, :string
  end
end
