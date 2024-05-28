class EshopController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]

def create
end

def eshop_index
  @items = Item.all
end

def eshop
end

def show
  @item = Item.find(params[:id])
  @related_items = Item.where.not(id: @item.id).limit(4) # Exclut l'item actuel et prend 4 items liés
end


end
