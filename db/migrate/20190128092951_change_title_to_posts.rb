class ChangeTitleToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :title, :string
  end
end
