class Product < ApplicationRecord
  acts_as_taggable_on :tags
  has_many :line_items, dependent: :destroy
  validates :title, :body, presence: true
end
