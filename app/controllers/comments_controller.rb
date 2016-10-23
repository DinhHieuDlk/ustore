class CommentsController < ApplicationController
  
  before_action :set_product, only: [:create, :destroy]
def new
  @comment = Comment.new
  
end
  def create
    @comment = @product.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Comment was successfully created.' }
        format.js 
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_product
      @product = Product.find(params[:product_id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :email, :rating, :review, :product_id)
    end
end
