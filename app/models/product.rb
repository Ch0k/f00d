class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates :title, :body, presence: true
end
