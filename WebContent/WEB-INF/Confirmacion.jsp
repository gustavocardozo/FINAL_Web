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
	<form action="AgregarReserva" method="post">
		<p>
			<b>CLIENTES:</b>
		</p>
		<table class="delete table" id="clientesAgregados">
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
			<li class="item" id="${reserva.vuelo.id}">
				${reserva.vuelo.desde.descripcion} -
				${reserva.vuelo.hacia.descripcion}</li>
		</ul>
		<c:if
			test="${reserva.paquete.id != 0 && reserva.paquete.id!='' && reserva.paquete.id!=null}">
			<p>
				<b>PAQUETE:</b>
			</p>
			<ul id="tablaPaquetes" class="itemMayor">
				<li class="item">${reserva.paquete.id}-
					${reserva.paquete.nombre}</li>
			</ul>
		</c:if>

		<p>
			<b>TOTAL:$${reserva.total}</b><br>
		</p>
		<h3>Desea confirmar la reserva?</h3>
		<span class="label label-warning">Recuerde que si no confirma,
			se perderán todos los datos cargados</span> <br><br><input
			class="btn btn-primary" type="submit" value="Confirmar"> <a
			href="Index?borrar=true"><input class="btn btn-primary"
			type="button" name="Cancelar" value="Cancelar"></a>
	</form>
	</section>
</body>
</html>