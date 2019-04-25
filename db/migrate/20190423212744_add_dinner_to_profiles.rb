class AddDinnerToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :dinner, :boolean
  end
end
