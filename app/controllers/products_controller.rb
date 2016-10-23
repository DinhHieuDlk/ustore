class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products
  # GET /products.json
  def index
    if params[:category].blank?
      @products = Product.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id)
    end

  end

  # GET /products/1
  # GET /products/1.json
  def show
    @random_product = Product.where.not(id: @product).order("RANDOM()").first(4)
    @related_product = Product.where(category_id: @product.id)
  end

  # GET /products/new
  def new
    @product = current_user.products.build
  end

  # GET /products/1/edit



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
