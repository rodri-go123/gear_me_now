class PagesController < ApplicationController
  def home
  end

  def dashboard
    @rentals = current_user.rentals
    @items = current_user.items
  end
end
