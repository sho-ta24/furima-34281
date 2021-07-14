class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @management_street_address = ManagementStreetAddress.new
  end

  def create
    @management_street_address = ManagementStreetAddress.new(orders_params)
    if @management_street_address.valid?
      @management_street_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def orders_params
    params.permit(:postal_code, :prefecture, :city, :addresses, :building, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
