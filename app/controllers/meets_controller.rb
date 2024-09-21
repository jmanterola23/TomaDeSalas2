class MeetsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @meets = @room.meets.order(hour: :asc)
    @meet = @room.meets.build
  end

  def reserve
    @meet = Meet.find(params[:id])
    room = @meet.room
  
    begin
      if params[:participants].to_i <= room.capacity - (@meet.participants_count || 0)
        if @meet.update(reserved: true, participants_count: params[:participants])
          room.update(capacity: room.capacity - params[:participants].to_i)
          render json: { success: true }
        else
          render json: { success: false }, status: :unprocessable_entity
        end
      else
        render json: { success: false, message: "No hay suficiente capacidad disponible." }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, message: "Reunión no encontrada." }, status: :not_found
    end
  end
  
  

  def cancel_reservation
    @meet = Meet.find(params[:id])
    room = @meet.room
    # Restaura la capacidad
    participants_count = @meet.participants_count || 0 # Si es nil, se convierte en 0
    room.update(capacity: room.capacity + participants_count)
    # Elimina la reserva
    if @meet.update(reserved: false, participants_count: 0) # O ajusta según tu lógica
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

end
