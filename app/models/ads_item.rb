class AdsItem < ApplicationRecord
  include PgSearch
  include AASM

  belongs_to :user
  belongs_to :category, counter_cache: :count_of_ads

  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :text, length: { maximum: 300 }
  mount_uploaders :images, ImageUploader
  validates :category, presence: { message: (I18n.t 'category_cant_be_blank').to_s }

  aasm do
    state :draft, initial: true
    state :new
    state :approved
    state :refused
    state :archived

    event :to_new do
      transitions from: :draft, to: :new
    end

    event :approve do
      transitions from: :new, to: :approved
    end

    event :decline do
      transitions from: :new, to: :refused
    end

    event :return do
      transitions from: :new, to: :draft
    end
  end

  pg_search_scope :search, against: { title: 'A', text: 'B' },
                           using: { tsearch: { any_word: true, prefix: true},
                                    dmetaphone: { sort_only: true} }

  scope :approved_scope, -> { where(aasm_state: :approved) }
  scope :approved_new_scope, -> { where(aasm_state: [:approved, :new]) }

  def self.perform_search(keyword)
    if keyword.present?
      AdsItem.approved_new_scope.search(keyword)
    else
      AdsItem.approved_new_scope.all
    end
  end

  def self.filter(filter)
    where(category_id: filter) if filter
  end
end
