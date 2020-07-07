class AddProfileVisibleFlagToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :visible, :boolean, default: true
  end
end
