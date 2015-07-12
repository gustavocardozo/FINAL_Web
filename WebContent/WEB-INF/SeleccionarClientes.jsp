<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seleccion de Clientes</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		// When the HTML DOM is ready loading, then execute the following function...
		$('.selectorCliente').click(function() {
			$('#idCliente').val($(this).attr('id'));
// 			alert($(this).attr('id'));
		});
		
		$('#tablaClientes').click(function() { // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
		// 			$.get('GetPaquete', function(responseText) { // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
		// 				$('#detallePaquete').text(responseText); // Locate HTML DOM element with ID "somediv" and set its text content with the response text.	
			$.ajax({
// 				context : this,
				type : "GET",
				url : 'GetCliente',
				async : false,
				dataType : "html",
				cache : false,
				data : {
					idCliente : $('#idCliente').val()
				},
				success : function(responseText) {
					$('#detalleCliente').html(responseText);
					$('#agregar').click(function() {
						$.ajax({
// 							context : this,
							type : "POST",
							url : 'GetCliente',
							async : false,
							dataType : "json",
							cache : false,
							data : {
								idCliente : $('#idCliente').val(),
								accion: "add"
							},
							success :
								function(responseJson) {
								$('.delete').remove();
								 var $table = $('<table class="delete"><thead><td>Nombre</td><td>Apellido</td><td>DNI</td></thead>').appendTo($('#clientesSeleccionados')); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
						            $.each(responseJson, function(index, cliente) {    // Iterate over the JSON array.
						                $('<tr value="'+cliente.id+'">').appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
						                    .append($('<td>').text(cliente.nombre))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
						                    .append($('<td>').text(cliente.apellido))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
						                    .append($('<td>').text(cliente.dni))    // Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
						                    .append($('<td id="append'+cliente.id+'">'))
						                    .append($('<td class="invisible">').text(cliente.id))
						                    $('<input type="button" id="eliminar'+cliente.id+'" value="Eliminar"></input>').appendTo($("#append"+cliente.id+""))
						                    $('#eliminar'+cliente.id).click(function(){
								            	alert($(this).closest('tr').children('td.invisible').text());						            
						                    	$.ajax({
						 							context : this,
													type : "POST",
													url : 'GetCliente',
													async : false,
													dataType : "json",
													cache : false,
													data : {
														idCliente : $(this).closest('tr').children('td.invisible').text(),
														accion: "delete"
													},
													success :
														function(responseJson) {				            
									                    	$(this).closest('tr').remove();
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
		<h3>Clientes</h3>
		<p>Nombre</p>
		<ul id="tablaClientes" class="itemMayor">
				<c:forEach items="${clientes}" var="cliente">
					<li class="item">${cliente.nombre} <a id="${cliente.id}" class="selectorCliente">[+Ver más]</a></li>
				</c:forEach>
		</ul>
		<input type="hidden" id="idCliente" name="idCliente" value="">
	<div id="detalleCliente"></div>

	<div id="seleccionCliente">
		<form action="SeleccionarClientes" method="post">
			<h3>Clientes seleccionados</h3>
			<div id="clientesSeleccionados">
			<table class="delete"><thead><td>Nombre</td><td>Apellido</td><td>DNI</td></thead></table></div>
			<input type="submit" name="siguiente" value="Siguiente">
		</form>
	</div>

	</section>

</body>
</html>