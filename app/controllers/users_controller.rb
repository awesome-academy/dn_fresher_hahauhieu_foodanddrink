class UsersController < ApplicationController
  before_action :authenticate_user!, :correct_user, only: :show

  def show
    @q = @current_user.orders.ransack(params[:q])
    @pagy, @user_orders = pagy(@q.result.sort_orders,
                               items: Settings.per_page_10)
  end

  private

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end
end
