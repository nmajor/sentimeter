class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :organization, foreign_key: true
      t.integer :price
      t.string :name

      t.timestamps
    end
    add_index :products, :price
  end
end
