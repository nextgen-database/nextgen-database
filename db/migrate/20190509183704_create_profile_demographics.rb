class CreateProfileDemographics < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_demographics do |t|
      t.integer :profile_id
      t.integer :demographic_id

      t.timestamps
    end
  end
end
