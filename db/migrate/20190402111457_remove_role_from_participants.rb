class RemoveRoleFromParticipants < ActiveRecord::Migration[5.2]
  def change
    remove_column :participants, :role, :integer
  end
end
