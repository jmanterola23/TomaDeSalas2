class Meet < ApplicationRecord
  belongs_to :room

  # Atributos necesarios:
  # - description: Texto que describe la reunión
  # - reserved: Booleano que indica si la reunión está reservada
  # - hour: Hora específica de la reunión

  validates :description, presence: true
  validates :hour, presence: true

  # Método para reservar la reunión
  def reserve!
    update(available: false) if available
  end
end
