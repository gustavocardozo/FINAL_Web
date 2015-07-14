<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ page import="model.Cliente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar reserva - Travel Sistems</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
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
	<h3>Desea confirmar la reserva?</h3>
	<span>Recuerde que si no confirma, se perderán todos los datos
		guardados</span>
	<br>
	<form action="AgregarReserva" method="post">
		<p>
			<b>CLIENTES:</b>
		</p>
		<table class="delete" id="clientesAgregados">
			<thead>
				<td>Nombre</td>
				<td>Apellido</td>
				<td>DNI</td>
			</thead>
			<tbody>
				<c:forEach items="${reserva.clientes}" var="cliente">
					<tr>
						<td>${cliente.nombre}</td>
						<td>${cliente.apellido}</td>
						<td>${cliente.dni}</td>
						<td class="invisible">${cliente.id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p>
			<b>VUELO:</b>
		</p>
		<ul id="tablaVuelos" class="itemMayor">
			<c:forEach items="${vuelos}" var="vuelo">
				<li class="item" id="${vuelo.id}">${vuelo.desde}</td>
					<td class="item" id="${vuelo.id}">${vuelo.hacia}</li>
			</c:forEach>
		</ul>
		<c:if test="${paquete.id != '0'}">
			<p>
				<b>PAQUETE:</b>
			</p>
			<ul id="tablaPaquetes" class="itemMayor">
					<li class="item">${paquete.nombre}</li>
			</ul>
		</c:if>

		<h3>Total:</h3>${reserva.total}<br> <input type="submit" value="Confirmar"> 
			<a href="Index?borrar=true"><input type="button" name="Cancelar" value="Cancelar"></a>
	</form>
	</section>
</body>
</html>