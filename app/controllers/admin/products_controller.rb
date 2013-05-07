class Admin::ProductsController < ApplicationController
  # GET /admin/products
  # GET /admin/products.json
  def index
    @admin_products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_products }
    end
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
    @admin_product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_product }
    end
  end

  # GET /admin/products/new
  # GET /admin/products/new.json
  def new
    @admin_product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_product }
    end
  end

  # GET /admin/products/1/edit
  def edit
    @admin_product = Product.find(params[:id])
  end
  
  # POST /admin/products
  # POST /admin/products.json
  def create
    category_ids = params[:product][:category_ids]
    params[:product].delete(:category_ids)
    @admin_product = Product.new(params[:product])
    if category_ids
      category_ids.each { |id| @admin_product.categories << Category.find(id) }
    end

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_product_path(@admin_product), notice: 'Product was successfully created.' }
        format.json { render json: @admin_product, status: :created, location: @admin_product }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/products/1
  # PUT /admin/products/1.json
  def update
    category_ids = params[:product][:category_ids]
    params[:product].delete(:category_ids)
    @admin_product = Product.find(params[:id])
    params[:product][:categories] = Array.new
    if category_ids
      category_ids.each { |id| params[:product][:categories]. << Category.find(id) }
    end

    respond_to do |format|
      if @admin_product.update_attributes(params[:product])
        format.html { redirect_to admin_product_path(@admin_product), notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product = Product.find(params[:id])
    @admin_product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end

  # GET /admin/products/1/visible
  def visible
    @admin_product = Product.find(params[:product_id])
    @admin_product.visible = true
    
    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_products_path, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admin_products_path, notice: 'Error while updating product.' }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /admin/products/1/unvisible
  def unvisible
    @admin_product = Product.find(params[:product_id])
    @admin_product.visible = false
    
    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_products_path, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admin_products_path, notice: 'Error while updating product.' }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end
end
