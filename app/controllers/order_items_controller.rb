class OrderItemsController < ApplicationController
    before_action :load_order, only: [:create]
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  def create

      @order_item = OrderItem.new(item_id: params[:item_id], order_id: @order.id)
          respond_to do |format|
          if @order_item.save
          format.html { redirect_to @order, notice: 'Successfully added product to cart.' }
          format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
        format.html { redirect_to products_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def load_order
  begin
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create(status: "unsubmitted")
    session[:order_id] = @order.id
  end
end
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
        params.require(:order_item).permit(:item_id, :order_id, :quantity)
    end
 
end
