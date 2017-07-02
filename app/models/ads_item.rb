class AdsItem < ApplicationRecord
  validates :title, presence: true, :length => {
    :maximum   => 100}
  validates :text, :length => {
    :maximum   => 800}
  paginates_per 50
  mount_uploaders :images, ImageUploader   
  serialize :images, JSON # If you use SQLite, add this line.
end
