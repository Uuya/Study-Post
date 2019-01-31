class ChangeStudytimeToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :study_time, :integer
    add_column :posts, :study_minutes, :integer
  end
end
