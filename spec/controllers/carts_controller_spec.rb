require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe 'GET #show' do
    let(:cart) { create(:cart) }
    before { get :show, params: { id: cart } }

    it 'show cart' do 
      expect(assigns(:cart)).to eq cart
    end 
    
    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
  
    let!(:cart) { create(:cart) } 
    it 'destroy cart in database' do
      session[:cart_id] = cart.id
      expect{ delete :destroy, params: { id: cart } }.to change(Cart, :count).by(-1)
    end

    it 'redirect to index' do
      delete :destroy, params: { id: cart}
      expect(response).to redirect_to store_index_url
    end
  end
end
