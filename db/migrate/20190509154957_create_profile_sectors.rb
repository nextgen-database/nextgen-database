class CreateProfileSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_sectors do |t|
      t.integer :profile_id
      t.integer :sector_id

      t.timestamps
	end
  end
end
