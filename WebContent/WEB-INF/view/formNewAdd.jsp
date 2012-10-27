<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="addNewAdress">
		<p>Numero:</p>
		<input id="num" type="text" name="num" /><br>
		<p>Rue:</p>
		<input id="rue" type="text" name="rue" /><br>
		<p>Code Postal:</p>
		<input id="code" type="text" name="code" /><br>
		<p>Ville:</p>
		<input id="ville" type="text" name="ville" /><br> 
		<button type="submit" value="${contactId}" name="Valider" >Valider</button><br>
	</form>



</body>
</html>