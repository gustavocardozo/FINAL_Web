<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/MasterPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema de vuelos</title>
</head>
<body>
<section class="contenedor">
	<div class="formulario">
		<p><span class="label label-default">Reservas disponibles</span></p>
		<div class="list-group">
		<c:forEach items= "${reservas}" var="reserva">
			<a class="list-group-item" href="?idReserva=${reserva.id}"> <b>${reserva.id}</b> - ${reserva.vuelo.desde.nombre} - ${reserva.vuelo.hacia.nombre} </a>
		</c:forEach>
		</div>
	</div>
</section>
</body>
</html>