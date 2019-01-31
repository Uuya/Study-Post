class Post < ApplicationRecord
  belongs_to :user
  validates :title,          presence: true, length: { maximum: 20 }
  validates :studied_at,     presence: true, uniqueness: true, length: { is: 8 }
  validates :study_time,     presence: true
  validates :study_minutes,  presence: true
  validates :content,        presence: true
  validates :study_method,   presence: true
end
