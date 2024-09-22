class RoomsController < ApplicationController
    def index
      @rooms = Room.order(:name) # Ordenar por nombre y número
    end
  end