class Post < ApplicationRecord
  belongs_to :user
  validates :title,          presence: true, length: { maximum: 20 }
  validates :studied_at,     presence: true, uniqueness: true
  validates :study_time,     presence: true
  validates :content,        presence: true
  validates :study_method,   presence: true
end
