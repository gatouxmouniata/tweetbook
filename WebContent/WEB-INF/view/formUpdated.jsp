<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.esiea.ihm.project.model.Contacts"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details Contact</title>
</head>
<body>

	<form method="post" action="recupAndUpdate">
		<p>Nom:</p>
		<input id="nom" type="text" value="${contact.nom}" name="nom" />
		<br>
		<p>Prenom:</p>
		<input id="prenom" type="text" value="${contact.prenom}" name="prenom" />
		<br>
		<p>Email:</p>
		<input id="email" type="text" value="${contact.email}" name="email" />
		<br>
		<p>Date:</p>
		<input id="date" type="text" value="${contact.dateString}" name="date" />
		<br>
		<p>Actif:</p>
		<input id="actif" value="${contact.actif}" type="checkbox" name="actif" />
		<br> 
		<br> 
		<br>
		<button type="submit" value="${contact.id}" name="Update">Valider</button>
	</form>

	<c:forEach var="valueArray" items="${requestScope['address']}">
		<c:out value="${valueArray}" />

		<form method="post" action="removeAdd">
			<button type="submit" value="${valueArray.id}" name="Supprimer">Supprimer</button>
		</form>
		<form method="post" action="updateAdd">
			<button type="submit" value="${valueArray.id}" name="Update">Modifier</button>
		</form>
		<br>
		<br>
	</c:forEach>
	
	<form method="post" action="addNewAdressForm">
		<button type="submit" value="${contact.id}" name="AddNewAdressForm">Ajouter une adresse</button>
	</form>

</body>
</html>