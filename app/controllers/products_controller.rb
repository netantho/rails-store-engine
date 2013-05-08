class ProductsController < ApplicationController
  def index
  	@products = Product.visible
  end
end
