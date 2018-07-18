class RemoveUserFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :user, :json, default: {}
  end
end
