require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    let(:users) { create_list(:user,3) } 
    before { get :index }

    it 'populates an array of all users' do 
      expect(assigns(:users)).to match_array(users)
    end 
    
    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #edit' do
    let(:user) { create(:user) } 
    before { get :edit, params: { id: user } }

    it 'populates an array of all users' do 
      expect(assigns(:user)).to eq user
    end 
    
    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'GET #update' do
    let(:user) { create(:user) } 
    before { get :edit, params: { id: user } }

    it 'populates an array of all users' do 
      patch :update, params: { id: user, user: attributes_for(:user)}
      expect(assigns(:user)).to eq user
    end 

    it 'change user attribute' do 
      #patch :update, params: { id: user, user: {title: 'new title', body: 'new body'}}
      #user.reload
      #expect(product.title).to eq 'new title'
      #expect(product.body).to eq 'new body'
    end

    it 'redirect to update question' do 
      patch :update, params: { id: user, user: attributes_for(:user)}
      expect(response).to redirect_to users_url
    end
  end
end
