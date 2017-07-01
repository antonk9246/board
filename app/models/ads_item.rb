class AdsItem < ApplicationRecord
  validates_presence_of :title
  validates :title, presence: true, :length => {
    :maximum   => 30}
  validates :text, :length => {
    :minimum   => 3,
    :maximum   => 100}
  mount_uploader :image_file, ImageUploader            
end
