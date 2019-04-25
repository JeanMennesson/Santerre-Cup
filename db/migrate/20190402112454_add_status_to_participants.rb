class AddStatusToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :status, :integer
  end
end
