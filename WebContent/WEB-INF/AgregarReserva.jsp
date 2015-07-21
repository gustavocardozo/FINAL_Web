<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ page import="model.Cliente" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

<form action="SuccessAddReservas" >
<h2>Agregar Reserva</h2>
<p>${string}</p>
<p>
<span>Seleccione un paquete</span>
<select id="paquetes" name ="paquetes">
	<c:forEach items= "${paquetes}" var="paquete">
		<option value="${paquete.id}"> ${paquete.nombre} </option>
	</c:forEach>
</select>
</p>

<!-- <p> -->
<!-- <span>Observaciones:</span> -->
<!-- <input type="text" name="observaciones"> -->
<!-- </p> -->
<input type= "submit" name= "aceptar" value="Agregar">
 <span>Clientes en esta reserva: ${CantClientes}</span>

</form>
<div class="listaClientes">
	<h3>Lista de clientes: </h3>
	<c:forEach items= "${clientes}" var="cliente">
		<span>${cliente.nombre}</span>  <a href="?agregarcliente=${cliente.id}">Agregar</a><br>
	</c:forEach>
</div>

</section>
</body>
</html>