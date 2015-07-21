<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/MasterPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seleccion de Paquete</title>
<script>
	$(document)
			.ready(
					function() {
						$("#borrarSession").val("true");

						// 		$(".menu").click(function(){

						// 			if(confirm("Si continua se perderan los datos cargados. ¿Desea continuar?"))
						// 			{
						// 				$.ajax({

						// 					type : "GET",
						// 					url : 'LimpiarSession',
						// 					async : false,
						// 					dataType : "html",
						// 					cache : false,
						// 					success : function(responseText) {
						// 					}
						// 				});

						// 			}
						// 		});

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
						if (paquetes.length == 0) {
							$("#tablaPaquetes")
									.html(
											"<span class='error'>No hay paquetes disponibles para los destinos seleccionados</span>");
							//$("#submitPaquetes").hide();
							//$("#volver").show();
						}
						var vuelos = $("#tablaVuelos li");
						if (vuelos.length == 0) {
							$("#tablaVuelos")
									.html(
											"<span class='error'>No hay vuelos disponibles para los destinos seleccionados</span>");
							$("#submitPaquetes").hide();
							$("#volver").css("visibility", "visible")
						}
						$('#tablaPaquetes .selectorPaquete').click(function() { // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
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
						$('#tablaVuelos .selectorVuelo').click(function() { // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
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

						$(function() {

							if ($("#idPaquete").val() != 0) {
								$
										.ajax({

											type : "GET",
											url : 'GetPaquete',
											async : false,
											dataType : "html",
											cache : false,
											data : {
												idPaquete : $('#idPaquete')
														.val()
											},
											success : function(responseText) {
												$('#detallePaquete').html(
														responseText);
												$('#eliminarPaquete')
														.click(
																function() {
																	$(
																			'#detallePaquete')
																			.html(
																					"");
																	$(
																			"#idPaquete")
																			.val(
																					"0");
																	// 			 alert($(this).attr('id'));
																});

											}
										});
							}

							if ($("#idVuelo").val() != 0) {
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
	<section class="contenedor">
	<div id="seleccionPaquete">
		<form action="SeleccionarPaquete" method="post">
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Paquetes</h3></div>
				<div class="panel-body">
						<ul id="tablaPaquetes" class="itemMayor">
							<c:forEach items="${paquetes}" var="paquete">
								<li class="item">${paquete.nombre } <a id="${paquete.id}"
									class="selectorPaquete">[+Seleccionar]</a></li>
							</c:forEach>
						</ul>
					
					<c:choose>
						<c:when test="${paquete.id!=null}">
							<input type="hidden" id="idPaquete" name="idPaquete"
								value="${paquete.id}">
						</c:when>
						<c:otherwise>
							<input type="hidden" id="idPaquete" name="idPaquete" value="0">
						</c:otherwise>
					</c:choose>
	
					<div id="detallePaquete"></div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading"><h3 class="panel-title">Vuelos</h3></div>
				<div class="panel-body">
				<ul id="tablaVuelos" class="itemMayor">
					<c:forEach items="${vuelos}" var="vuelo">

						<li class="item" id="${vuelo.id}">${vuelo.desde.nombre}-
							</td>
						<td class="item" id="${vuelo.id}">${vuelo.hacia.nombre} <a
								id="${vuelo.id}" class="selectorVuelo">[+Seleccionar]</a>
						</li>

					</c:forEach>
				</ul>
				<div id="detalleVuelo"></div>
				<c:choose>
					<c:when test="${vuelo.id!=null}">
						<input type="hidden" id="idVuelo" name="idVuelo"
							value="${vuelo.id}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="idVuelo" name="idVuelo" value="0">
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<input class="btn btn-primary" type="submit" id="submitPaquetes" name="siguiente"
				value="Siguiente"> 
			<a href="SeleccionarDestinos" class="invisible" id="volver" value="Volver">
				<button type="button" class="btn btn-primary">Volver</button>
			</a>
		</form>
	</div>
	</section>
</body>
</html>