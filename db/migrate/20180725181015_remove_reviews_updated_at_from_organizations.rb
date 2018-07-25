class RemoveReviewsUpdatedAtFromOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_index :organizations, :reviews_updated_at
    remove_column :organizations, :reviews_updated_at, :time
  end
end
