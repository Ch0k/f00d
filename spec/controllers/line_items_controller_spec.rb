require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do

  describe 'POST #create' do
    let(:product) { create(:product) }

    it 'create object in database' do 
      expect { post :create, params: { product_id: product } }.to change(LineItem,:count).by(1)
    end

    it 'renders root path' do
      post :create, params: {product_id: product} 
      expect(response).to redirect_to store_index_url
    end
  end
end
