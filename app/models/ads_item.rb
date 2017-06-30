class AdsItem < ActiveRecord::Base
  # class AdsItem < ApplicationRecord
  validates :title, presence: true, :length => {
    :minimum   => 3,
    :maximum   => 30}
  validates :image, presence: true,
                    length: { minimum: 4 }
  validates :text, :length => {
    :minimum   => 3,
    :maximum   => 100}
                    
end
