<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seleccionar Destinos</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		// When the HTML DOM is ready loading, then execute the following function...
		// 		$('#selectOrigen').click(function() {
		// 			$('#origen').val($(this).val());
		// 		});
		// 		$('#selectDestino').click(function() {
		// 			$('#destino').val($(this).val());
		// 		});

		$("#selectOrigen").change(function() {
			$('#origen').val($(this).children(":selected").attr("id"));
		});
		$("#selectDestino").change(function() {
			$('#destino').val($(this).children(":selected").attr("id"));
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
		<li><a href="SeleccionarPaquete">Agregar reserva</a></li>
		<li><a href="UpdateReserva">Modificar reserva</a></li>
	</ul>

	<div id="errores" name="errores">
		<c:forEach items="${errores}" var="error">
			<p>${error}</p>
		</c:forEach>
	</div>

	<form action="SeleccionarDestinos" method="post">
		<p>Origen:</p>
		<select id="selectOrigen">
			<c:forEach items="${destinos}" var="destino">
				<option id="${destino.id}">${destino.nombre}</option>
			</c:forEach>
		</select> <label for="selectOrigen" style="display: none">Debe
			seleccionar origen</label> <input type="hidden" name="origen" id="origen"
			value="0">
		<p>Destino:</p>
		<select id="selectDestino">
			<c:forEach items="${destinos}" var="destino">
				<option id="${destino.id}">${destino.nombre}</option>
			</c:forEach>
		</select><label for="selectDestino" style="display: none">Debe
			seleccionar destino</label> <input type="hidden" name="destino" id="destino"
			value="0"> <input type="submit" name="siguiente"
			value="Siguiente">
	</form>
</body>
</html>