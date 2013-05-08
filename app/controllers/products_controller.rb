class ProductsController < ApplicationController
  def index
  	@products = Product.visible
  end
  
  def show
    @product = Product.visible.find_by_id(params[:id])
  end
end
