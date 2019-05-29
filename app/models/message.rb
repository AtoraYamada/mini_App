class Message < ApplicationRecord
  belongs_to :user

  validates :body, :picture, presence: true
  mount_uploader :picture, ImageUploader
end
