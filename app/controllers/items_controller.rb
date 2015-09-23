class ItemsController < ApplicationController
#    before_action :set_item, only: [:show, :edit, :update, :destroy]    
#    
     def index
         @items = Item.all
  end
#    
#    
     def new
         @item = Item.new
  end
#    
#    
#    
#    
#    
    def create
        @item = Item.new(item_params)
        @item.product_id = params[:product_id]

        @item.save

        redirect_to product_path(@item.product)
     end
    

#
#      # POST /items
#  # POST /items.json
#  def create
#    @item = Item.new(item_params)
#
#    respond_to do |format|
#      if @item.save
#        format.html { redirect_to @item, notice: 'item was successfully created.' }
#        format.json { render :show, status: :created, location: @item }
#      else
#        format.html { render :new }
#        format.json { render json: @item.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#    
#
#
#
#
# # PATCH/PUT /items/1
#  # PATCH/PUT /items/1.json
#  def update
#    respond_to do |format|
#      if @item.update(item_params)
#        format.html { redirect_to @item, notice: 'item was successfully updated.' }
#        format.json { render :show, status: :ok, location: @item }
#      else
#        format.html { render :edit }
#        format.json { render json: @item.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#
#
#
#
# def destroy
#    @item.destroy
#    respond_to do |format|
#        format.html { redirect_to products_url, notice: 'item was successfully     destroyed.' }
#      format.json { head :no_content }
#    end
#  end
    

    
def destroy
    @product = Product.find(params[:product_id])
    @item = @product.items.find(params[:id])
    @item.destroy
    respond_to do |format|
        format.html { redirect_to product_path(@product), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
#    
#    
private
def set_item
    @item = Item.find(params[:id])
    end
#
    
#    
def item_params
    params.require(:item).permit(:title, :description, :price_to, :price_from, :price_save, :image_url)
end
#    
#    
#    
end
#
#
#
