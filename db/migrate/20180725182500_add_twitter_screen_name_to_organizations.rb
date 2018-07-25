class AddTwitterScreenNameToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :twitter_screen_name, :string
  end
end
