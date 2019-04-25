class ChangeGenderFormatInProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :gender, :integer, using: 'gender::integer'
  end
end
