class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]

  def index
    if (current_user.id == @item.user_id) || @item.management.present?
      redirect_to root_path
    else
      @management_street_address = ManagementStreetAddress.new
    end
  end

  def create
    @management_street_address = ManagementStreetAddress.new(orders_params)
    if @management_street_address.valid?
      pay_item
      @management_street_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def orders_params
    params.require(:management_street_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def find_item
    @item = Item.find_by(id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: orders_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
