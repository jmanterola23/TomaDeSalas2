$(document).on('click', '.btn-success', function() {
    const roomId = $(this).data('room-id');
    const meetId = $(this).data('meet-id');
    const availableCapacity = $(this).data('available-capacity');

    $('#meet_id').val(meetId);
    $('#availableCapacity').text(`Capacidad disponible: ${availableCapacity}`);
    $('#reservationForm').attr('action', `/meets/${meetId}/reserve`); // Ajusta la ruta según tu configuración
});