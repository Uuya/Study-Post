class AddStudiedAtFromPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :studied_at, :integer, null: false
  end
end
