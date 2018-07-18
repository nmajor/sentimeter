class AddRemoteCreatedAtToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :remote_created_at, :time
    add_index :reviews, :remote_created_at
  end
end
