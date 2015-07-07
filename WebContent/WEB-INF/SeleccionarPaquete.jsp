<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seleccion de Paquete</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		// When the HTML DOM is ready loading, then execute the following function...
		$('#tablaPaquetes td').click(function() {
			$('#idPaquete').val($(this).attr('id'));
			// 			 alert($(this).attr('id'));
		});
		$('#tablaVuelos td').click(function() {
			$('#idVuelo').val($(this).attr('id'));
			// 			 alert($(this).attr('id'));
		});
		$('#tablaPaquetes').click(function() { // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
		// 			$.get('GetPaquete', function(responseText) { // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
		// 				$('#detallePaquete').text(responseText); // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
			$.ajax({

				type : "GET",
				url : 'GetPaquete',
				async : false,
				dataType : "html",
				cache : false,
				data : {
					idPaquete : $('#idPaquete').val()
				},
				success : function(responseText) {
					$('#detallePaquete').html(responseText);
				}
			});
		});
		$('#tablaVuelos').click(function() { // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
			// 			$.get('GetPaquete', function(responseText) { // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
			// 				$('#detallePaquete').text(responseText); // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
				$.ajax({

					type : "GET",
					url : 'GetVuelo',
					async : false,
					dataType : "html",
					cache : false,
					data : {
						idVuelo : $('#idVuelo').val()
					},
					success : function(responseText) {
						$('#detalleVuelo').html(responseText);
					}
				});
			});
	});
</script>
</head>
<body>
	<div>
		<img src="img/icono.png">
	</div>
	<ul class="menu">
		<li><a href="Index">Home</a></li>
		<li><a href="SeleccionarDestinos">Agregar reserva</a></li>
		<li><a href="UpdateReserva">Modificar reserva</a></li>
	</ul>
	<div id="errores" name="errores">
					<c:forEach items="${errores}" var="error">
						<p>${error}</p>
					</c:forEach>
	</div>
	<div id="seleccionPaquete">
		<form action="SeleccionarPaquete" method="post">
			<h2>Paquetes</h2>
			<table id="tablaPaquetes">
				<thead>
					<tr>
						<td>Descripción</td>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${paquetes}" var="paquete">
						<tr>
							<td id="${paquete.id}">${paquete.nombre}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="hidden" id="idPaquete" name="idPaquete" value="">
			<div id="detallePaquete"></div>
			<h2>Vuelos</h2>
			<table id="tablaVuelos">
				<thead>
					<tr>
						<td>Descripción</td>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${vuelos}" var="vuelo">
						<tr>
							<td id="${vuelo.id}">${vuelo.desde}</td>
							<td id="${vuelo.id}">${vuelo.hacia}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="detalleVuelo"></div>
			<input type="hidden" id="idVuelo" name="idVuelo" value="">
			<input type="submit" name="siguiente" value="Siguiente">
		</form>
	</div>
	
</body>
</html>