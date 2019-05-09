class CreateProfileDevelopmentActors < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_development_actors do |t|
      t.integer :profile_id
      t.integer :development_actor_id

      t.timestamps
    end
  end
end
