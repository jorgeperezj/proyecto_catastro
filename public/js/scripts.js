document.addEventListener('DOMContentLoaded', function () {
    console.log('Documento cargado y listo');
});

function mostrarMensaje(mensaje) {
    alert(mensaje);
}

document.getElementById('miBoton')?.addEventListener('click', function () {
    mostrarMensaje('Has hecho clic en el botón');
});
