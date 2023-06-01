class PagesController < ApplicationController
  def home
  end

  def dashboard
    @rentals = current_user.rentals
    @items = current_user.items
  end

  def map
    @items = Item.all
    raise

    if params[:query].present?
      @items = @items.super_search(params[:query])
    end

    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        info_window_html: render_to_string(partial: "pages/shared/info_window", locals: {item: item})
      }
    end
  end
end
