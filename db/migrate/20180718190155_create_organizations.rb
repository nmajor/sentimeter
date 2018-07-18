class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :desc
      t.references :category, foreign_key: true
      t.string :keywords, array: true, default: []
      t.string :homepage_url
      t.integer :positive_score
      t.integer :negative_score

      t.timestamps
    end
  end
end
