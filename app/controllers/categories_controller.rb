class CategoriesController < ApplicationController
  def show
  	@products = Product.visible.includes(:categories).where(categories: { id: params[:id] })
  end
end
