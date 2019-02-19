class RemoveStudiedAtFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :studied_at
  end
end
