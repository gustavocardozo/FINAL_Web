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
<h2 class="label label-success">Reservas disponibles</h2><br><br>
<p>
<span>Seleccione una reserva</span><br>
	<c:forEach items= "${reservas}" var="reserva">
		<a href="?idReserva=${reserva.id}"> <b>${reserva.id}</b> - ${reserva.vuelo.desde.nombre} - ${reserva.vuelo.hacia.nombre} </a><br>
	</c:forEach>
</p>
</section>
</body>
</html>