class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :motto
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
