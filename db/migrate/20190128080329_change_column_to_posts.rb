class ChangeColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :studied_at, :integer
    change_column :posts, :study_time, :integer
  end
end
