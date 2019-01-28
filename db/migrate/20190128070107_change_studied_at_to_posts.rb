class ChangeStudiedAtToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :studied_at, :time
  end
end
