# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update]

  def index
    authorize! :index, User
    @users = User.all
  end

  def edit
    authorize! :update, @user
  end

  def update
    authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def orders
    authorize! :read, @user
    @user = current_user
    @orders = @user.orders
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(role_ids: [])
  end
end
