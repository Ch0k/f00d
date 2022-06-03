# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email last_name first_name phone])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to store_index_url, notice: exception.message
  end
end
