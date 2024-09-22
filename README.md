# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.2.2

* Rails version: Rails 7.0.8.4

* Deployment instructions:

-Para poder correr el proyecto lo primero que debemos hacer, es clonar el repositorio:

    "git clone https://github.com/tu_usuario/tu_repositorio.git
    cd tu_repositorio"

-Instalar las dependencias necesarias:
     
    "bundle install"

-Creación de base de datos y correr migraciones:

    "rails db:create
    rails db:migrate"

-Para precargar las salas y reuniones, se debe correr el archivo seed.rb:

    "rails db:seed"

-Una vez todo configurado y precargado, procedemos a correr el comando para levantar nuestro servidor rails:

    "rails server ó rails s"

*Testing instructions:

Para realizar pruebas, siga los siguientes casos:

1.- Ingresar a la url raiz del proyecto:

      "http://localhost:3000/rooms/"

2.- Al ingresar, vera el listado de Salas o rooms disponibles para usar:

  ![image](https://github.com/user-attachments/assets/f470333b-39ea-4e93-b67f-bd068e627df5)


3.- Al seleccionar una Sala, vera el listado de horas, con su disponibilidad:
      
  ![image](https://github.com/user-attachments/assets/cf2125a4-27e3-4b05-af4a-d322b8c3a1a4)

  

4.- Para reservar, oprima el boton verde "Reservar", el cual le pedira a continuación a traves de un modal, la cantidad de       asistentes:
      
  ![image](https://github.com/user-attachments/assets/755e51a7-39d5-4769-b2e5-c3a8da3ceb11)
  
  ![image](https://github.com/user-attachments/assets/7bd4b95e-4e17-448a-bdab-6a31d4d405e1)


5.- Una vez reservada, aparecera el boton de cancelar reserva, para cancelarla, presionelo:
      
  ![image](https://github.com/user-attachments/assets/4cf3432d-034f-430a-b6b4-708088033191)


6.- Cuando se hace una reserva se resta de la capacidad de la Sala, según el numero de asistenes, lo mismo ocurre al       cancelar la reserva:

  ![image](https://github.com/user-attachments/assets/0fc035e8-3a1f-40a8-a790-7ef2ff7b2fbd)
  ![image](https://github.com/user-attachments/assets/2c388ed8-ea2a-4374-9749-9152f700ff89)




