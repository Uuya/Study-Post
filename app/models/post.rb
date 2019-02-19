class Post < ApplicationRecord
  belongs_to :user
  validates :title,          presence: true, length: { maximum: 20 }
  validates :learning_date,     presence: true, uniqueness: true, length: { is: 8, allow_blank: true }
  validates :study_time,     presence: true
  validates :study_minutes,  presence: true
  validates :content,        presence: true
  validates :study_method,   presence: true
end
