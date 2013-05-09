class CartsController < ApplicationController
  before_filter :require_login_user, only: [:checkout, :quick_order]
  before_filter :have_at_least_one_item_in_cart, only: [:checkout]
  before_filter :item_should_be_visible, only: [:quick_order]
  
  def index
    if session.has_key?(:cart) && !session[:cart].nil?
      session[:cart][:price] = 0
      session[:cart][:items].each do |key, value|
        if !value.nil?
          product = Product.visible.find_by_id(key)
          session[:cart][:items][key][:photo] = product.photo
          session[:cart][:items][key][:title] = product.title
          session[:cart][:items][key][:description] = product.description
          session[:cart][:items][key][:price] = product.price
          session[:cart][:items][key][:total] = product.price * session[:cart][:items][key][:quantity]
          session[:cart][:price] += session[:cart][:items][key][:total]
        end
      end
    end
  end

  def add
    id = params[:product_id]
  	if session.has_key?(:cart) && !session[:cart].nil?
  	  session[:cart][:num] += 1
  	  if session[:cart][:items].has_key? id
  	    session[:cart][:items][id][:quantity] += 1
  	  else
  	    session[:cart][:items][id] = {quantity: 1}
  	  end
  	else
  	  session[:cart] = {}
  	  session[:cart][:num] = 1
  	  session[:cart][:items] = {}
  	  session[:cart][:items][id] = {quantity: 1}
  	end
  	redirect_to URI(request.referer).path
  end
  
  def del
    id = params[:product_id]
    if session.has_key?(:cart) && !session[:cart].nil? && session[:cart][:num] > 1
      if session[:cart][:items].has_key? id
        session[:cart][:num] -= 1
        if session[:cart][:items][id][:quantity] == 1
          session[:cart][:items][id] = nil
        else
          session[:cart][:items][id][:quantity] -= 1
        end
      end
    elsif session.has_key?(:cart) && !session[:cart].nil? && session[:cart][:num] == 1
      session[:cart] = nil
    end
    redirect_to URI(request.referer).path
  end
  
  def empty
    if session.has_key? :cart
      session[:cart] = nil
    end
    redirect_to root_path
  end
  
  def checkout
    total_price = 0
    sales = []
    session[:cart][:items].each do |key, value|
      if !value.nil?
        product = Product.visible.find_by_id(key)
        sale = Sale.new(quantity: session[:cart][:items][key][:quantity],
                          price: product.price)
        sale.product = product
        sale.save
        sales << sale
        total_price += product.price * sale.quantity
      end
    end
    Order.create(status: 'pending', total_price: total_price, sales: sales, user: current_user)
    session[:cart] = nil
    redirect_to root_path, notice: 'Your order has been completed, you should receive it in 5 business days.'
  end

  def quick_order
    p = Product.visible.find_by_id params[:product_id]
    s = Sale.new(quantity: 1, price: p.price)
    s.product = p
    s.save
    Order.create(status: 'pending', total_price: p.price, sales: [s], user: current_user)
    redirect_to root_path, notice: 'Your order has been completed, you should receive it in 5 business days.'
  end

  private
  
  def have_at_least_one_item_in_cart
    if session[:cart].nil?
      flash[:error] = "You need to have at least one item in your cart to checkout."
      redirect_to root_url
    end
  end
  
  def item_should_be_visible
    if !Product.visible.find_by_id params[:product_id]
      flash[:error] = "Invalid product"
      redirect_to root_url
    end
  end
end
