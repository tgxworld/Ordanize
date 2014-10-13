class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :shipping_policy
      t.integer :price
      t.integer :user_id
      t.integer :quantity

      t.timestamps
    end

    add_index :products, :user_id
  end
end
