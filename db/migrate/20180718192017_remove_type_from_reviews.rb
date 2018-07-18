class RemoveTypeFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :type, :string
  end
end
