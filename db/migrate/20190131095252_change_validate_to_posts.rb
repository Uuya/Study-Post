class ChangeValidateToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :study_minutes, false
  end
end
