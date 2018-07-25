class RemovePositiveAndNegativeScoresFromOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :positive_score, :integer
    remove_column :organizations, :negative_score, :integer
  end
end
