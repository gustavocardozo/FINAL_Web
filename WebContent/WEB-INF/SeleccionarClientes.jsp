<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/MasterPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seleccion de Clientes</title>
<script>
	$(document)
			.ready(
					function() {
						// When the HTML DOM is ready loading, then execute the following function...
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
						$('.selectorCliente').click(function() {
							$('#idCliente').val($(this).attr('id'));
							// 			alert($(this).attr('id'));
						});

						$('#clientesAgregados tbody tr')
								.each(
										function(index) {
											$(
													'#eliminar'
															+ $(this)
																	.children(
																			'td.invisible')
																	.text())
													.click(
															function() {
																$
																		.ajax({
																			context : this,
																			type : "POST",
																			url : 'GetCliente',
																			async : false,
																			dataType : "json",
																			cache : false,
																			data : {
																				idCliente : $(
																						this)
																						.closest(
																								'tr')
																						.children(
																								'td.invisible')
																						.text(),
																				accion : "delete"
																			},
																			success : function(
																					responseJson) {
																				$(
																						this)
																						.closest(
																								'tr')
																						.remove();
																			}
																		});

															});

										});

						$('#tablaClientes')
								.click(
										function() { // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
											// 			$.get('GetPaquete', function(responseText) { // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
											// 				$('#detallePaquete').text(responseText); // Locate HTML DOM element with ID "somediv" and set its text content with the response text.	
											$
													.ajax({
														// 				context : this,
														type : "GET",
														url : 'GetCliente',
														async : false,
														dataType : "html",
														cache : false,
														data : {
															idCliente : $(
																	'#idCliente')
																	.val()
														},
														success : function(
																responseText) {
															$('#detalleCliente')
																	.html(
																			responseText);
															$('#agregar')
																	.click(
																			function() {
																				$
																						.ajax({
																							// 							context : this,
																							type : "POST",
																							url : 'GetCliente',
																							async : false,
																							dataType : "json",
																							cache : false,
																							data : {
																								idCliente : $(
																										'#idCliente')
																										.val(),
																								accion : "add"
																							},
																							success : function(
																									responseJson) {
																								$(
																										'.delete')
																										.remove();
																								var $table = $(
																										'<table class="delete table"><thead><td>Nombre</td><td>Apellido</td><td>DNI</td></thead>')
																										.appendTo(
																												$('#clientesSeleccionados')); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
																								$
																										.each(
																												responseJson,
																												function(
																														index,
																														cliente) { // Iterate over the JSON array.
																													$(
																															'<tr value="'+cliente.id+'">')
																															.appendTo(
																																	$table)
																															// Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
																															.append(
																																	$(
																																			'<td>')
																																			.text(
																																					cliente.nombre))
																															// Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
																															.append(
																																	$(
																																			'<td>')
																																			.text(
																																					cliente.apellido))
																															// Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
																															.append(
																																	$(
																																			'<td>')
																																			.text(
																																					cliente.dni))
																															// Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
																															.append(
																																	$('<td id="append'+cliente.id+'">'))
																															.append(
																																	$(
																																			'<td class="invisible">')
																																			.text(
																																					cliente.id))
																													$(
																															'<input type="button" class="btn btn-primary" id="eliminar'+cliente.id+'" value="Eliminar"></input>')
																															.appendTo(
																																	$("#append"
																																			+ cliente.id
																																			+ ""))
																													$(
																															'#eliminar'
																																	+ cliente.id)
																															.click(
																																	function() {
																																		// 								            	alert($(this).closest('tr').children('td.invisible').text());						            
																																		$
																																				.ajax({
																																					context : this,
																																					type : "POST",
																																					url : 'GetCliente',
																																					async : false,
																																					dataType : "json",
																																					cache : false,
																																					data : {
																																						idCliente : $(
																																								this)
																																								.closest(
																																										'tr')
																																								.children(
																																										'td.invisible')
																																								.text(),
																																						accion : "delete"
																																					},
																																					success : function(
																																							responseJson) {
																																						$(
																																								this)
																																								.closest(
																																										'tr')
																																								.remove();
																																					}
																																				});
																																	});

																												});

																							}
																						});
																			});
														}
													});
										});

					});

	// function CargarGrilla(responseJson) {
	// 		$('.delete').remove();
	// 		 var $table = $('<table class="delete">').appendTo($('#clientesSeleccionados')); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
	//             $.each(responseJson, function(index, cliente) {    // Iterate over the JSON array.
	//                 $('<tr>').appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
	//                     .append($('<td>').text(cliente.nombre))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
	//                     .append($('<td>').text(cliente.apellido))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
	//                     .append($('<td>').text(cliente.dni))    // Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
	//                     .append($('<td class="toAppend">'))
	//             });
	// 	}
</script>
</head>
<body>
	<section class="contenedor">
	<h3>Clientes</h3>
	<p>Nombre</p>
	<ul id="tablaClientes" class="itemMayor">
		<c:forEach items="${clientes}" var="cliente">
			<li class="item">${cliente.nombre}<a id="${cliente.id}"
				class="selectorCliente">[+Ver más]</a></li>
		</c:forEach>
	</ul>
	<input type="hidden" id="idCliente" name="idCliente" value="">
	<div id="detalleCliente"></div>

	<div id="seleccionCliente">
		<form action="SeleccionarClientes" method="post">
			<h3>Clientes seleccionados</h3>
			<div id="clientesSeleccionados">
				<c:if test="${clientesAgregados!=null}">
					<table class="delete table" id="clientesAgregados">
						<thead>
							<td>Nombre</td>
							<td>Apellido</td>
							<td>DNI</td>
						</thead>
						<tbody>
							<c:forEach items="${clientesAgregados}" var="cliente">
								<tr>
									<td>${cliente.nombre}</td>
									<td>${cliente.apellido}</td>
									<td>${cliente.dni}</td>
									<td><input type="button" class="btn btn-primary"
										id="eliminar${cliente.id}" value="Eliminar"></td>
									<td class="invisible">${cliente.id}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
			<input type="submit" class="btn btn-primary" name="siguiente"
				value="Siguiente">
		</form>
	</div>

	</section>

</body>
</html>