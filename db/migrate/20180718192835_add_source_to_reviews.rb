class AddSourceToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :source, :json, default: {}
  end
end
