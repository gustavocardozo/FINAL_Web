<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/MasterPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LogIn</title>
</head>
<body>
	<section class="contenedor">
	<form id="formLogin" class="formulario" action="LogIn" method="post">
		<label for="user">Usuario: </label><input type="text" id="user"
			name="user"><br> <label for="pass">Contraseña: </label><input
			type="password" id="pass" name="pass"><br> <br> <input
			type="submit" class="btn btn-primary" name="siguiente"
			value="Siguiente">
	</form>
	</section>
</body>
</html>