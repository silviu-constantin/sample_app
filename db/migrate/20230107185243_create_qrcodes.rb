class CreateQrcodes < ActiveRecord::Migration[6.1]
  def change
    create_table :qrcodes do |t|
      t.string :name

      t.timestamps
    end
  end
end
