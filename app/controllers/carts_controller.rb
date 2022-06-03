# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show; end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html do
        redirect_to store_index_url,
                    notice: 'Your cart is currently empty'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to store_index_url, notice: 'Invalid cart'
  end
end
