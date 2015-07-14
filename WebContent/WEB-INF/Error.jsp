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

	<h1>Hubo un error al procesar su solicitud. Intente nuevamente mas</h1>
<!-- 	<div id="errores" name="errores" class="error"> -->
<%-- 		<c:forEach items="${errores}" var="error"> --%>
<%-- 			<h1>${error}</h1> --%>
<%-- 		</c:forEach> --%>
<!-- 	</div> -->
<span>Comuniquese al area de Atención al Cliente 1111-4444</span>
	<a href="Index">Volver a la home</a>
</body>
</html>