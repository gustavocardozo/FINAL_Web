<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Seleccion de Paquete</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		// When the HTML DOM is ready loading, then execute the following function...
		$('#tablaPaquetes .selectorPaquete').click(function() {
			$('#idPaquete').val($(this).attr('id'));
			// 			 alert($(this).attr('id'));
		});
		$('#tablaVuelos .selectorVuelo').click(function() {
			$('#idVuelo').val($(this).attr('id'));
			// 			 alert($(this).attr('id'));
		});
		var paquetes = $("#tablaPaquetes li");
		if(paquetes.length == 0){
			$("#tablaPaquetes").html("<span class='error'>No hay paquetes disponibles para los destinos seleccionados</span>");
			//$("#submitPaquetes").hide();
			//$("#volver").show();
		}
		var vuelos = $("#tablaVuelos li");
		if(vuelos.length == 0){
			$("#tablaVuelos").html("<span class='error'>No hay vuelos disponibles para los destinos seleccionados</span>");
			$("#submitPaquetes").hide();
			$("#volver").css("visibility","visible")
		}
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
					$('#eliminarPaquete').click(function() {
						$('#detallePaquete').html("");
						$("#idPaquete").val("0");
						// 			 alert($(this).attr('id'));
					});
					
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
						$('#eliminarVuelo').click(function() {
							$('#detalleVuelo').html("");
							$("#idVuelo").val("0");
							// 			 alert($(this).attr('id'));
						});
						
						
					}
				});
			});
		
		$(function(){
			
			if($("#idPaquete").val()!=0){
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
						$('#eliminarPaquete').click(function() {
							$('#detallePaquete').html("");
							$("#idPaquete").val("0");
							// 			 alert($(this).attr('id'));
						});
						
					}
				});
			}
			
			if($("#idVuelo").val()!=0){
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
						$('#eliminarVuelo').click(function() {
							$('#detalleVuelo').html("");
							$("#idVuelo").val("0");
							// 			 alert($(this).attr('id'));
						});
						
						
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<header>
	<div>
		<img src="img/icono.png">
	</div>
	<ul class="menu">
		<li><a href="Index">Home</a></li>
		<li><a href="SeleccionarDestinos">Agregar reserva</a></li>
		<li><a href="UpdateReserva">Modificar reserva</a></li>
	</ul>
	</header>
	<section class="contenedor">
	<div id="errores" class="error" name="errores">
					<c:forEach items="${errores}" var="error">
						<p>${error}</p>
					</c:forEach>
	</div>
	<div id="seleccionPaquete">
		<form action="SeleccionarPaquete" method="post">
			<div>
			<h3>Paquetes</h3>
				<p>Descripción</p>
					<ul id="tablaPaquetes" class="itemMayor">
						<c:forEach items="${paquetes}" var="paquete">
							<li class="item">${paquete.nombre} <a  id="${paquete.id}" class="selectorPaquete">[+Agregar]</a></li>
						</c:forEach>
					</ul>
					
			<c:choose>
				<c:when test="${paquete.id!=null}">
					<input type="hidden" id="idPaquete" name="idPaquete" value="${paquete.id}">	
				</c:when>
				<c:otherwise>
					<input type="hidden" id="idPaquete" name="idPaquete" value="0">
				</c:otherwise>
			</c:choose>
			
			<div id="detallePaquete"></div>
			</div>
			<div>
			<h3>Vuelos</h3>
				<p>Descripción</p>
					<ul id="tablaVuelos" class="itemMayor">
					<c:forEach items="${vuelos}" var="vuelo">
						
							<li class="item" id="${vuelo.id}">${vuelo.desde}</td><td class="item" id="${vuelo.id}">${vuelo.hacia} <a  id="${vuelo.id}" class="selectorVuelo">[+Agregar]</a></li>
						
					</c:forEach>
					</ul>
			<div id="detalleVuelo"></div>
			<c:choose>
				<c:when test="${vuelo.id!=null}">
					<input type="hidden" id="idVuelo" name="idVuelo" value="${vuelo.id}">
				</c:when>
				<c:otherwise>
					<input type="hidden" id="idVuelo" name="idVuelo" value="0">
				</c:otherwise>
			</c:choose>
			</div>
			<input type="submit" id="submitPaquetes" name="siguiente" value="Siguiente">
			<a href="SeleccionarDestinos" class="invisible" id="volver" value="Volver">Volver</a>
		</form>
	</div>
	</section>
</body>
</html>