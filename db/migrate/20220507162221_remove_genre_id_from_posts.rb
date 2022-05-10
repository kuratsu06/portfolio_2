class RemoveGenreIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :genre, null: false, foreign_key: true
  end
end
