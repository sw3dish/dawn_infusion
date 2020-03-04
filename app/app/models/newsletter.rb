class Newsletter < ApplicationRecord
  has_many :newsletter_items
  has_many :stories, :through => :newsletter_items
end
