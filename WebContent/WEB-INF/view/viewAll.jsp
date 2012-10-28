<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1><c:forEach var="valueArray"  items="${requestScope['contact']}">
 
		          <c:out value="${valueArray}"/>
		          <form method="post" action="remove">
		          <button type="submit" value="${valueArray.id}" name="Supprimer" >Supprimer</button>
		          </form>
		          <form method="post" action="update">
		          <button type="submit" value="${valueArray.id}" name="Update">Modifier</button>
		          			
	  			  </form>
		          <br>
		          <br>
		</c:forEach></h1>
		
		<form method="post" action="index.jsp">
			<button type="submit" name="retour">Retour</button>
		</form>
		
</body>
</html>