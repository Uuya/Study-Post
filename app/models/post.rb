class Post < ApplicationRecord
  belongs_to :user
  validates :title,          presence: true
  validates :studied_at,     presence: true
  validates :study_time,     presence: true
  validates :content,        presence: true
  validates :study_method,   presence: true
end
