class CreateBindus < ActiveRecord::Migration[6.1]
  def change
    create_table :bindus do |t|
      t.string :name
      t.text :menu

      t.timestamps
    end
  end
end
