<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/MasterPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
	$(document).ready(function() {
		// When the HTML DOM is ready loading, then execute the following function...
		// 		$('#selectOrigen').click(function() {
		// 			$('#origen').val($(this).val());
		// 		});
		// 		$('#selectDestino').click(function() {
		// 			$('#destino').val($(this).val());
		// 		});
		$("#borrarSession").val("true");

		// 		$(".menu").click(function(){

		// 			if(confirm("Si continua se perderan los datos cargados. ¿Desea continuar?"))
		// 			{
		// 				$.ajax({

		// 					type : "GET",
		// 					url : 'LimpiarSession',
		// 					async : false,
		// 					dataType : "html",
		// 					cache : false,
		// 					success : function(responseText) {
		// 					}
		// 				});
		// 			}
		// 		});

		$("#selectOrigen").change(function() {
			$('#origen').val($(this).children(":selected").attr("id"));
		});
		$("#selectDestino").change(function() {
			$('#destino').val($(this).children(":selected").attr("id"));
		});

		$(function() {
			$("#selectOrigen").val($("#origen").val());
			$("#selectDestino").val($("#destino").val());
		});

	});
</script>


</head>
<body>
	<section class="contenedor">
	<form action="SeleccionarDestinos" method="post">
		<h3>Origen:</h3>
		<select id="selectOrigen" class="form-control">
			<c:forEach items="${destinos}" var="destino">
				<option id="${destino.id}" value="${destino.id}">${destino.nombre}</option>
			</c:forEach>
		</select> <label for="selectOrigen" style="display: none">Debe
			seleccionar origen</label>
		<c:if test="${vuelo.desde.id != null}">

		</c:if>

		<c:choose>
			<c:when test="${vuelo.desde.id != null}">
				<input type="hidden" name="origen" id="origen"
					value="${vuelo.desde.id}">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="origen" id="origen" value="0">
			</c:otherwise>
		</c:choose>
		<h3>Destino:</h3>
		<select id="selectDestino" class="form-control">
			<c:forEach items="${destinos}" var="destino">
				<option id="${destino.id}" value="${destino.id}">${destino.nombre}</option>
			</c:forEach>
		</select><label for="selectDestino" style="display: none">Debe
			seleccionar destino</label>

		<c:choose>
			<c:when test="${vuelo.hacia.id != null}">
				<input type="hidden" name="destino" id="destino"
					value="${vuelo.hacia.id}">
				<br>
				<br>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="destino" id="destino" value="0">
				<br>
				<br>
			</c:otherwise>
		</c:choose>

		<input type="submit" class="btn btn-primary" name="siguiente"
			value="Siguiente">
	</form>
	</section>
</body>
</html>