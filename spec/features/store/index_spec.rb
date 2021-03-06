require 'rails_helper'

feature 'User can see all products', %q{
  the user can look at all the products to find a similar product   
} do

  given!(:products) { create_list(:product, 3) }

  scenario 'User see all products in store url' do
    visit store_index_url
    products.each do |product|
      expect(page).to have_content product.title
    end
  end
end

