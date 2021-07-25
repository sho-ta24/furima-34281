class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_item, only: [:index, :create]

  def index
    @management_street_address = ManagementStreetAddress.new
  end

  def create
    @management_street_address = ManagementStreetAddress.new(orders_params)
    binding.pry
    if @management_street_address.valid?
      @management_street_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def orders_params
    params.require(:management_street_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def find_item
    @item = Item.find_by(id: params[:item_id])
  end

end

