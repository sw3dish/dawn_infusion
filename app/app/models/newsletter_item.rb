class NewsletterItem < ApplicationRecord
  belongs_to: :story
  belongs_to: :newsletter
end
