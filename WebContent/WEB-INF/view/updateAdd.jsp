<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="recupAndUpdateAdd">
		<p>Numero:</p>
		<input id="num" type="text" value="${address.numero}" name="num" /><br>
		<p>Rue:</p>
		<input id="rue" type="text" value="${address.rue}" name="rue" /><br>
		<p>Code Postal:</p>
		<input id="code" type="text" value="${address.codePostal}" name="code" /><br>
		<p>Ville:</p>
		<input id="ville" type="text" value="${address.ville}" name="ville" /><br>
		
		<button type="submit" value="${address.id}" name="Update">Valider</button>		
	</form>
</body>
</html>