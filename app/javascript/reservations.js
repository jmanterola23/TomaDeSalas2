import 'bootstrap/dist/css/bootstrap'
import 'bootstrap'

document.addEventListener('turbo:load', function() {
    // Al hacer clic en el botón "Reservar"
    document.querySelectorAll('.btn-success').forEach(button => {
      button.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el botón recargue la página

        // Obtener los datos del botón
        const meetId = this.getAttribute('data-meet-id');
        const availableCapacity = this.getAttribute('data-available-capacity');

        // Rellenar el modal con los datos
        document.getElementById('meet_id').value = meetId;
        document.getElementById('availableCapacity').textContent = `Capacidad disponible: ${availableCapacity}`;

        // Abrir el modal
        $('#reservationModal').modal('show');
      });
    });

    // Manejar el envío del formulario en el modal
    const reservationForm = document.getElementById('reservationForm');
    reservationForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevenir el envío del formulario tradicional
        const meetId = document.getElementById('meet_id').value;
        const participantsCount = document.getElementById('participants').value;
        const roomId = this.getAttribute('data-room-id'); // Obtener el ID de la sala

        fetch(`/rooms/${roomId}/meets/${meetId}/reserve`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({ participants: participantsCount })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                $('#reservationModal').modal('hide'); // Cerrar el modal si la reserva fue exitosa
                window.location.reload(); // Recargar la página para actualizar las reservas
            } else {
                alert(data.message || 'Ocurrió un error al realizar la reserva');
            }
        })
        .catch(error => console.error('Error:', error));
    });

});


  