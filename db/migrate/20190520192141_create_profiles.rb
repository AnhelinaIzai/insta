class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :nickname
      t.integer :age
      t.string :avatar

      t.timestamps
    end
  end
end
