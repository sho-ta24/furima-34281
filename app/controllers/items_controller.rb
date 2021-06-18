class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  def index
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

  def move_to_signed_in
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_free_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
