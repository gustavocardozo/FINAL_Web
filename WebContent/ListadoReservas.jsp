<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Sistema de vuelos</title>
</head>
<body>
<header>
<div><img src="img/icono.png"></div>
<ul class="menu">
<li><a href="">Home</a></li>
<li><a href="AgregarReserva">Agregar reserva</a></li>
<li><a href="UpdateReserva">Modificar reserva</a></li>
</ul>
</header>
<section class="contenedor">
<h2>Reservas disponibles</h2>
<p>
<span>Seleccione una reserva</span><br>
	<c:forEach items= "${reservas}" var="reserva">
		<a href="?id=${reserva.id}"> ${reserva.paquete.nombre} </a><br>
	</c:forEach>
</p>
</section>
</body>
</html>