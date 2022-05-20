require 'rails_helper'

RSpec.describe StoreController, type: :controller do

  describe 'GET #index' do
    let(:products) { create_list(:product,3) } 
    before { get :index }

    it 'populates an array of all question' do 
      expect(assigns(:products)).to match_array(products)
    end 
    
    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
