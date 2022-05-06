class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.string :subtitle, null: false, default: "no title"
      t.text :diary, null: false

      t.timestamps
    end
  end
end
