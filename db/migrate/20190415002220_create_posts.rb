class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :published
      t.text :content
      t.string :slug, index: true, unique: true

      t.timestamps
    end
  end
end
