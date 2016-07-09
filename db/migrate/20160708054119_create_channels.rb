class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :title
      t.string :slug
      t.string :color

      t.timestamps null: false
    end
    add_index :channels, :slug, unique: true
  end
end
