class AdsItem < ApplicationRecord
  include PgSearch
  pg_search_scope :search_content_for, :against => { :title => 'A', :text => 'B'}, using: { tsearch: { any_word: true } }
  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :text, length: { maximum: 800 }
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :category
  validates :category, presence: { message: (I18n.t 'category_cant_be_blank').to_s }
end
