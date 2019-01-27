class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :title,              null: false
      t.integer :studied_at,         null: false
      t.integer :study_time,         null: false
      t.string  :content,            null: false
      t.string  :study_method,       null: false
      t.string  :reflection
      t.string  :next_study
      t.string  :other
      t.timestamps
    end
  end
end
