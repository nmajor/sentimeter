class AddReviewsUpdatedAtToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :reviews_updated_at, :time
    add_index :organizations, :reviews_updated_at
  end
end
