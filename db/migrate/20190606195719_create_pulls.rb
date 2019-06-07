class CreatePulls < ActiveRecord::Migration[5.2]
  def change
    create_table :pulls do |t|
      t.integer :gender
      t.string :size
      t.string :number
      t.references :profile, foreign_key: true
      t.timestamps
    end
  end
end
