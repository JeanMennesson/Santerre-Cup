class AddPartyToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :party, :boolean
  end
end
