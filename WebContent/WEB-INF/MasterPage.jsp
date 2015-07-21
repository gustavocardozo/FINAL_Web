<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script>
	$(document)
			.ready(
					function() {
						// When the HTML DOM is ready loading, then execute the following function...
						$(".menu")
								.click(
										function() {
											if ($("#borrarSession").val() == "true") {
												if (confirm("Si continua se perderan los datos cargados. ¿Desea continuar?")) {
													$.ajax({
														type : "GET",
														url : 'LimpiarSession',
														async : false,
														dataType : "html",
														cache : false,
														success : function(
																responseText) {
														}
													});
												}
											}
										});
					});
</script>
</head>
<body>
	<header>
	<div id="logo">
		<label class="logo">Travel System ®</label>
	</div>
	<div id="logIn">
		<c:if test="${usuario != null}">
			<label class="label label-success">${usuario}</label><a class="btn btn-default" href="LogIn?logOut=true">Salir</a>
		</c:if>
	</div>
	<ul class="menu">
		<li><a href="Index">Home</a></li>
		<li><a href="SeleccionarDestinos">Agregar reserva</a></li>
		<li><a href="UpdateReserva">Modificar reserva</a></li>
	</ul>
	</header>
	<section class="contenedor">
	<div id="errores" name="errores" class="error">
		<c:forEach items="${errores}" var="error">
			<p>${error}</p>
		</c:forEach>
	</div>
	<input id="borrarSession" type="hidden" value="false">
	</section>
	
</body>
</html>