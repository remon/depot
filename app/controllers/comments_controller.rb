class CommentsController < ApplicationController
   layout 'reg'
   before_filter :authorize,:except=>[:show,:index]
  before_filter :load_product

  def new
    @comment=@product.comments.new(params[:id])
  end
  
  def index
    @comments=@product.comments
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end
  def create
    @comment=@product.comments.new(params[:comment])
    respond_to do|format|
      if @comment.save
       format.html {redirect_to @product}
       else
        format.html {render :action=>'new'}
      end
    end
    end
    def show
      @comment=@product.comments.find(params[:id])
       respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
    end
def destroy
  @comment=@product.comments.find(params[:id])
  @comment.destroy
  respond_to do |format|
    format.html {redirect_to @product}
  end
end
 def edit
    @comment = @product.comments.find(params[:id])
    
  end
 def update
    @comment = @product.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @product , :notice => 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  protected 
    def load_product
    @product=Product.find(params[:product_id])
  end
end
