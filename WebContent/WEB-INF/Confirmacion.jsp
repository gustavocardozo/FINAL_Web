<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ page import="model.Cliente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/MasterPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmación</title>
</head>
<body>
	<section class="contenedor">
	<form class="formConfirmar" action="AgregarReserva" method="post">
		<p>
			<span class="label label-default">Clientes</span>
		</p>
		<table class="delete table table-striped" id="clientesAgregados">
			<thead>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>DNI</th>
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
			<span class="label label-default">Vuelo</span>
		</p>
		<ul id="tablaVuelos" class="itemMayor">
			<li class="item" id="${reserva.vuelo.id}">
				${reserva.vuelo.desde.descripcion} -
				${reserva.vuelo.hacia.descripcion}</li>
		</ul>
		<c:if
			test="${reserva.paquete.id != 0 && reserva.paquete.id!='' && reserva.paquete.id!=null}">
			<p>
				<span class="label label-default">Paquete</span>
			</p>
			<ul id="tablaPaquetes" class="itemMayor">
				<li class="item">${reserva.paquete.id}-
					${reserva.paquete.nombre}</li>
			</ul>
		</c:if>

		<p><span class="label label-default">Total</span></p>
		<h4 class="precio">$ ${reserva.total}</h4>
		<h3>Desea confirmar la reserva?</h3>
		<h5>
			<span class="error">Recuerde que si no confirma, se perderán todos los datos cargados</span> 
		</h5>
		<input class="btn btn-primary" type="submit" value="Confirmar"> 
		<a href="Index?borrar=true">
			<input class="btn btn-primary" type="button" name="Cancelar" value="Cancelar">
		</a>
	</form>
	</section>
</body>
</html>