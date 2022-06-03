require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:orders) { create_list(:order,3, user: user) } 
    before { get :index }

    it 'populates an array of all orders' do 
      expect(assigns(:orders)).to match_array(orders)
    end 

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }

    context 'with valide attributes' do

      it 'create object in database' do 
        expect { post :create, params: {order: attributes_for(:order)} }.to change(Order,:count).by(1)
      end
      it 'redirect in show view' do 
        post :create, params: {order: attributes_for(:order)} 
        expect(response).to redirect_to store_index_url
      end
    end

    context 'with invalide attributes' do
      it 'does not save question' do
        expect { post :create, params: {order: attributes_for(:order, :invalid)} }.to_not change(Order,:count)
      end

      it 're render new view' do
        post :create, params: {order: attributes_for(:order,:invalid)} 
        expect(response).to render_template :new
      end
    end
  end
end
