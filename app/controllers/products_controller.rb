class ProductsController < ApplicationController
  def index
  	@products = Product.visible
  end
  
  def show
    @product = Product.find_by_id(params[:id])
  end
end
