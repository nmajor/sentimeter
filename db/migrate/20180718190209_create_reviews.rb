class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :type
      t.references :organization, foreign_key: true
      t.json :full_sentiment
      t.string :sentiment

      t.timestamps
    end
    add_index :reviews, :type
    add_index :reviews, :sentiment
  end
end
