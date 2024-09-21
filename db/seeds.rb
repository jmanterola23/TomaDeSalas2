# db/seeds.rb

# Crear 5 salas
5.times do |i|
    Room.create(name: "Sala #{i + 1}", availability: "09:00-19:00", capacity: 10)
  end
  
  
  
  
