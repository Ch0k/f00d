class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user
  validates :address, presence: true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      puts(item.id)
      puts(item.cart_id)
      item.cart_id = nil
      puts(item.cart_id)
      line_items << item
    end
    line_items.each do |d|
      puts(d.id)
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
