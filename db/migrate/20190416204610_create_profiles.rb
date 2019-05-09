class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname

      t.timestamps
    end
  end
end
