class MeetsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @meets = Meet.where(room: @room, reserved: false)
  end

  def reserve
    @meet = Meet.find(params[:id])

    if @meet.update(reserved: true) # Marca la reunión como reservada
      redirect_to room_meets_path(@meet.room), notice: 'Reunión reservada con éxito.'
    else
      redirect_to room_meets_path(@meet.room), alert: 'No se pudo reservar la reunión.'
    end
  end
end
