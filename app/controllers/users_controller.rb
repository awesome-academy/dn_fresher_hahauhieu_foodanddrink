class UsersController < ApplicationController
  before_action :logged_in_user, :correct_user, only: :show

  def show
    @pagy, @user_orders = pagy(@current_user.orders.sort_orders,
                               items: Settings.per_page_10)
  end

  private

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end
end
