# frozen_string_literal: true

class StoreController < ApplicationController
  def index
    authorize! :read, Product
    @products = Product.all
  end
end
