class AddColumnSentimentToReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :sentiment, :string

    add_column :reviews, :sentiment, :integer
    add_index :reviews, :sentiment
  end
end
