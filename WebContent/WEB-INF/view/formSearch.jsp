<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recherche de contact</title>
</head>
<body>

	<form method="post" action="result_search">
		
		<p>Mots Cl�:</p>	<input id="keys" type="text" name="keys"/><br>
							
		<input type="submit" value="Valider" /><br>
	</form>
	
	<form method="post" action="index.jsp">
			<button type="submit" name="retour">Retour</button>
	</form>


</body>
</html>