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
      puts "Participants requested: #{params[:participants]}"  # Debug
      total_participants = @meet.participants_count.to_i + params[:participants].to_i
      
      if total_participants <= 10
        if params[:participants].to_i <= room.capacity - total_participants
          if @meet.update(reserved: true, participants_count: total_participants)
            room.update(capacity: room.capacity - params[:participants].to_i)
            render json: { success: true }
          else
            render json: { success: false, message: @meet.errors.full_messages.to_sentence }, status: :unprocessable_entity
          end
        else
          render json: { success: false, message: "No hay suficiente capacidad disponible en la sala." }, status: :unprocessable_entity
        end
      else
        render json: { success: false, message: "No se puede reservar más de 10 participantes en total." }, status: :unprocessable_entity
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
    if @meet.update(reserved: false, participants_count: 0)
      room.update(capacity: room.capacity + @meet.participants_count)
      redirect_to room_meets_path(room), notice: 'Reserva cancelada con éxito.' # Redirige después de cancelar
    else
      redirect_to room_meets_path(room), alert: 'No se pudo cancelar la reserva.'
    end
  end

end
