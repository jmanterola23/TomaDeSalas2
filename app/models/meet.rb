class Meet < ApplicationRecord
  belongs_to :room

   # Asegúrate de que el valor predeterminado sea 0
  after_initialize :set_default_participants_count, if: :new_record?

  validates :description, presence: true
  validates :hour, presence: true
  validates :participants_count, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def set_default_participants_count
    self.participants_count ||= 0
  end
  
  # Método para reservar la reunión
  #def reserve!
    #update(available: false) if available
  #end

  def reserve(participants)
    if participants <= available_capacity
      self.update(participants_count: (participants_count || 0) + participants)
    else
      errors.add(:base, "No hay suficiente capacidad disponible para la cantidad de participantes")
      false
    end
  end

  def available_capacity
    room.capacity - (participants_count || 0)
  end
end
