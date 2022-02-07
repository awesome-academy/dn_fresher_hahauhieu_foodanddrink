class UsersController < ApplicationController
  before_action :user_signed_in?, :correct_user, :find_user, only: :show

  def show
    @pagy, @user_orders = pagy(@user.orders.sort_orders,
                               items: Settings.per_page_10)
  end

  private

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t "errors.not_found"
    redirect_to root_path
  end
end
