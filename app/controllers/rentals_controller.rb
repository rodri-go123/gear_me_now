class RentalsController < ApplicationController
  before_action :set_item, only: [:new, :create]

  def create
    @rental = Rental.new(rental_params)
    @rental.item = @item
    @rental.user = current_user

    if @rental.save
      redirect_to item_path(@item)
    else
      raise
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
