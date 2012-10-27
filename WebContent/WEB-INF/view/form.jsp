<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajouter un nouveau contact</title>
</head>
<body>
		<form method="post" action="result">
		
							<p>Nom:</p>	<input id="nom" type="text" name="nom"/><br>
							<p>Prenom:</p><input id="prenom" type="text" name="prenom"/><br>
							<p>Email:</p><input id="email" type="text" name="email"/><br>
							<p>Date de Naissance:</p><input id="date" type="text" name="date"/><br>
							<p>Actif:</p><input id="actif" type="checkbox" name="actif"/><br>
							
							<p>Numero:</p>	<input id="num" type="text" name="num"/><br>
							<p>Rue:</p> <input id="rue" type="text" name="rue"/><br>
							<p>Code Postal:</p> <input id="code" type="text" name="code"/><br>
							<p>Ville:</p> <input id="ville" type="text" name="ville"/><br>
							
							
							<input type="submit" value="Valider" /><br>
		</form>

		<form method="post" action="index.jsp">
			<button type="submit" name="retour">Retour</button>
		</form>

</body>
</html>