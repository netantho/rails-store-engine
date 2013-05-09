class OrdersController < ApplicationController
  before_filter :require_login_user
  before_filter :valid_order, only: [:show]
  before_filter :show_its_own_order, only: [:show]
  
  def index
    @orders = Order.find_all_by_user_id(current_user.id)
  end
  
  def show
    @order = Order.find_by_id(params[:id])
  end
  
  private
  
  def valid_order
    if !Order.find_by_id(params[:id])
      flash[:error] = "Invalid order"
      redirect_to root_url
    end
  end
  
  def show_its_own_order
    if Order.find_by_id(params[:id]).user != current_user
      flash[:error] = "Invalid order"
      redirect_to root_url
    end
  end
end
