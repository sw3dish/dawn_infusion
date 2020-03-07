class Newsletter < ApplicationRecord
  validates :title, presence: true
  validates :publish_date, presence: true

  has_many :newsletter_items
  has_many :stories, :through => :newsletter_items
end
