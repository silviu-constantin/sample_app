class AddUserIdToQrcodes < ActiveRecord::Migration[6.1]
  def change
    add_column :qrcodes, :user_id, :integer
  end
end
