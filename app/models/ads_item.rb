class AdsItem < ApplicationRecord
  validates_presence_of :title
  validates :title, presence: true, :length => {
    :maximum   => 30}
  validates :text, :length => {
    :maximum   => 100}
  mount_uploaders :images, ImageUploader   
  serialize :images, JSON # If you use SQLite, add this line.
end
