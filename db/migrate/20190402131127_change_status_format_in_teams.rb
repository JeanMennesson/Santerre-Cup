class ChangeStatusFormatInTeams < ActiveRecord::Migration[5.2]
  def change
    change_column :teams, :status, :integer
  end
end
