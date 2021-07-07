class OdersController < ApplicationController
  def index
  end

  def new
    @management_street_address = ManagementStreetAddress.new
  end

  def create
    @management_street_address = ManagementStreetAddress.new(oders_params)
    if @management_street_address.valid?
      @management_street_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def oders_params
    params.require(:management_street_address).permit(:postal_code, :prefecture, :city, :addresses, :building, :phone_number,).merge(user_id: current_user.id)
  end
end
