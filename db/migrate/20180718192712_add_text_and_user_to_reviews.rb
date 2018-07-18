class AddTextAndUserToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :text, :text
    add_column :reviews, :user, :json, default: {}
  end
end
