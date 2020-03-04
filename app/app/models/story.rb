class Story < ApplicationRecord
  validates :title, presence: true

  has_many :newsletter_items
  has_many :newsletters, :through => :newsletter_items
end
