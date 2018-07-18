class AddRemoteIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :remote_id, :integer, :limit => 8
    add_index :reviews, :remote_id
  end
end
