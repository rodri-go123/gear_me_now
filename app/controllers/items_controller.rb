class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit destroy update]
  skip_before_action :authenticate_user!, only: %i[index show]
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
    @items = Item.all.where("id = ?", @item.id)
    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        info_window_html: render_to_string(partial: "pages/shared/info_window", locals: {item: item})
      }
    end
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

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :address, :image_url)
  end
end
