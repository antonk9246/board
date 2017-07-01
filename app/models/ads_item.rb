class AdsItem < ActiveRecord::Base
  # class AdsItem < ApplicationRecord
  validates :title, presence: true, :length => {
    :maximum   => 30}
  validates :text, :length => {
    :minimum   => 3,
    :maximum   => 100}
                    
end
