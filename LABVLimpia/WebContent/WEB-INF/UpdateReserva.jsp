<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ page import="model.Cliente" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
</head>
<body>
<header>
<div><img src="img/icono.png"></div>
<ul class="menu">
<li><a href="index">Home</a></li>
<li><a href="AgregarReserva">Agregar reserva</a></li>
<li><a href="UpdateReserva">Modificar reserva</a></li>
</ul>
</header>
<section class="contenedor">
<h2>Modificar Reserva</h2>
<form action="" >

<p>
<span>Paquete</span>
<select id="paquetes" name ="paquetes">
<c:forEach items= "${ paquetes }" var="paquete">
<option value="${ paquete.id }"> ${ paquete.nombre } </option>
</c:forEach>
</select>
</p>

<div class="listaClientes">
<h3>Lista de clientes para este paquete: </h3>
<c:forEach items= "${clientesReservaLista}" var="cliente">
<span>${cliente.nombre}</span>  <a href="?eliminarcliente=${cliente.id}">Eliminar</a><br>
</c:forEach>
</div>
<div class="listaClientes">
<h3>Todos los clientes: </h3>
<c:forEach items= "${clientes}" var="cliente">
<span>${cliente.nombre}</span>  <a href="?agregarcliente=${cliente.id}">Agregar</a><br>
</c:forEach>
</div>
<input type="hidden" name="idReserva" value="${idReserva}">
<input type= "submit" name= "aceptar" value="Modificar">


</form>

</section>
</body>
</html>