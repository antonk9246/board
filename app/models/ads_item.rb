class AdsItem < ApplicationRecord
  include PgSearch
  include AASM
  aasm do
    state :draft, :initial => true
    state :new
    state :approved
    state :refused
    state :archived

    event :to_new do
      transitions :from => :draft, :to => :new
    end

    event :approve do
      transitions :from => :new, :to => :approved
    end

    event :decline do
      transitions :from => :new, :to => :refused
    end

    event :return do
      transitions :from => :new, :to => :draft
    end
  end
  
  pg_search_scope :search, :against => { :title => 'A', :text => 'B'}, using: { tsearch: { any_word: true } }

  def self.perform_search(keyword)
    if keyword.present?
      AdsItem.search(keyword)
    else
      AdsItem.all
    end
  end

  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :text, length: { maximum: 300 }
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :category
  validates :category, presence: { message: (I18n.t 'category_cant_be_blank').to_s }
end
