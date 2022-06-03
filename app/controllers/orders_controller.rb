# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show edit update destroy]
  before_action :ensure_cart_isnt_empty, only: :new

  authorize_resource

  def index
    @orders = Order.all
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        format.html { redirect_to store_index_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to product_url(@order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_orders
    @orders = @user.orders if @user == current_user
  end

  private

  def ensure_cart_isnt_empty
    redirect_to store_index_url, notice: 'Your cart is empty' if @cart.line_items.empty?
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:address)
  end
end
