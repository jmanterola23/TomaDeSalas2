class Room < ApplicationRecord
  has_many :meets

  after_create :initialize_meetings
  validates :capacity, presence: true

  private

  def initialize_meetings
    (9..18).each do |hour| # Desde las 09:00 hasta las 18:00
      Meet.create(
        description: "Reunión en #{self.name} a las #{hour}:00",
        reserved: false,
        hour: Time.now.change(hour: hour, min: 0).utc, # Cambia esto si necesitas una zona horaria específica
        room: self
      )
    end
  end
end
