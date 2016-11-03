class Admin::ProductsController < Admin::ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]
  # GET /admin/products
  # GET /admin/products.json
  def index
    @admin_products = Product.all
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    @admin_product = current_user.products.build
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product =current_user.products.build(admin_product_params)

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_product_path(@admin_product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        format.html { redirect_to admin_product_path(@admin_product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def import
    Product.import(params[:file])
    redirect_to admin_products_path, notice:"update data successfully"
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      params.require(:product).permit(:name, :image, :price, :description, :category_id)
    end
end
