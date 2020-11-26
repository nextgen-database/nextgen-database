class CreateContentAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :content_abouts do |t|
      t.text :english
      t.text :french

      t.timestamps
    end
  end
end
