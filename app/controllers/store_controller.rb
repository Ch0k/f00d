# frozen_string_literal: true

class StoreController < ApplicationController
  def index
    authorize! :read, Product
    if params[:tag]
      @products = Product.tagged_with(params[:tag])
    else
      @products = Product.all
    end
  end

  def tag_cloud
    @tags = Product.tag_counts_on(:tags)
  end
end
