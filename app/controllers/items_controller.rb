class ItemsController < ApplicationController
  before_action :set_item, only: %i[show destroy]
  def index
    @items = Item.all

    if params[:query].present?
      @items = @items.super_search(params[:query])
    end
  end

  def new
    @item = Item.new
  end

  def show
    @rental = Rental.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :image_url)
  end
end
