class AdsItem < ApplicationRecord
  validates :title, presence: true, length: {
    maximum: 100
  }
  validates :text, length: {
    maximum: 800
  }
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :category
  validates :category, presence: true
end
