class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    else
      @order_form = OrderForm.new
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      Payjp.api_key = "sk_test_dedca0a8be8dd120cb297e8e"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: "jpy"
      )
      @order_form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :delivery_area_id, :city_name, :block_name, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  def sold_out_item
    if @item.order.present?
      redirect_to root_path 
    end
  end
end
