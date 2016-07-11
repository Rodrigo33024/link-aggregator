class CreateCommunityLinks < ActiveRecord::Migration
  def change
    create_table :community_links do |t|
      t.references :user, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true
      t.string :title
      t.string :link
      t.boolean :approved, default: false, null: false

      t.timestamps null: false
    end
    add_index :community_links, :link, unique: true
  end
end
