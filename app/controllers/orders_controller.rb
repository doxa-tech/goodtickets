class OrdersController < ApplicationController

  def new
    @items = [Item.new(name: "RJ Login")]
  end

  def get_form
    render plain: "<form><input></form>" 
  end

  def add_item
    render plain: ""
  end

end
