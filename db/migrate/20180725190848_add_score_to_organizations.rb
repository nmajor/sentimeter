class AddScoreToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :score, :float
    add_index :organizations, :score
  end
end
