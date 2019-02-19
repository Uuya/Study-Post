class AddStudiedAtFromPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :learning_date, :integer, null: false
  end
end
