class Admin::DashboardController < ApplicationController
  before_filter :order_is_pending, only: [:cancel]
  before_filter :order_is_paid, only: [:ship]
  before_filter :order_is_shipped, only: [:return]

  def index
    @orders_pending = Order.pending.order('id DESC').all
    @orders_cancelled = Order.cancelled.order('id DESC').all
    @orders_paid = Order.paid.order('id DESC').all
    @orders_shipped = Order.shipped.order('id DESC').all
    @orders_returned = Order.returned.order('id DESC').all
  end

  def show
  	@order = Order.find_by_id params[:id]
  end

  def cancel
  	order = Order.find_by_id(params[:id])
  	order.status = 'cancelled'
  	order.save
  	redirect_to admin_dashboard_path, notice: 'Order is now cancelled'
  end

  def ship
  	order = Order.find_by_id(params[:id])
  	order.status = 'shipped'
  	order.save
  	redirect_to admin_dashboard_path, notice: 'Order is now shipped'
  end

  def return
  	order = Order.find_by_id(params[:id])
  	order.status = 'returned'
  	order.save
  	redirect_to admin_dashboard_path, notice: 'Order is now returned'
  end

  def add
    sale = Sale.find_by_id(params[:sale_id])
    sale.quantity += 1
    sale.save
    order = Order.find_by_id(params[:id])
    order.total_price += sale.price
    order.save
  	redirect_to admin_dashboard_show_path(params[:id]), notice: 'Item added'
  end

  def del
    sale = Sale.find_by_id(params[:sale_id])
    if sale.quantity > 0
	  sale.quantity -= 1
	  sale.save
	  order = Order.find_by_id(params[:id])
	  order.total_price -= sale.price
	  order.save
	end
  	redirect_to admin_dashboard_show_path(params[:id]), notice: 'Item removed'
  end

  protected

  def choose_layout
    "_admin"
  end

  private

  def order_is_pending
  	if !params.has_key?(:id) || Order.find_by_id(params[:id]).status != 'pending'
  	  flash[:error] = "Order must be pending"
  	  redirect_to admin_dashboard_path
  	end
  end

  def order_is_shipped
  	if !params.has_key?(:id) || Order.find_by_id(params[:id]).status != 'shipped'
  	  flash[:error] = "Order must be shipped"
  	  redirect_to admin_dashboard_path
  	end
  end

  def order_is_paid
  	if !params.has_key?(:id) || Order.find_by_id(params[:id]).status != 'paid'
  	  flash[:error] = "Order must be paid"
  	  redirect_to admin_dashboard_path
  	end
  end
end
