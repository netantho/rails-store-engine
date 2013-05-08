class CartsController < ApplicationController
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
end
