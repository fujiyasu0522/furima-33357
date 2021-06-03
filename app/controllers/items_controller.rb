class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    # @item = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  private

    def item_params
      params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_cost_id, :delivery_area_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
    end

end
