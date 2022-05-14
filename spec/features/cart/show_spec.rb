require 'rails_helper'

feature 'User can see cart', %q{
  user can look at the cart   
} do

  given!(:product) { create(:product) }
  given!(:cart) { create(:cart) }
  given!(:line_item) { create(:line_item, product: product, cart: cart) }

  scenario 'User see cart' do
    visit cart_path(cart)
    expect(page).to have_content product.title
  end
end

