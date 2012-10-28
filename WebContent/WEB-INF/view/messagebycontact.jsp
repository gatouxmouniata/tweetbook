
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp" />
<title>Liste des messages vos messages</title>
</head>
<body>
	<div id="container">
		<div id="content">
			<div id="header">
			<table width="100%">
				<tr>
					<td width="50%" align="left">
						<h4>&nbsp;&nbsp;Liste de vos messages</h4>
					</td>
					<td align="right">
					
					</td>
				</tr>
			</table>
			</div>
			<div id="contacts">
				<table class="table-striped caption" width="100%">
					<c:forEach var="valueArray" items="${requestScope['message']}">
						<tr style="border-bottom: inset 1px silver;">						
							<td width="40%" align="left">
									<div style="margi-left: 15px; margin-top: 1px">
									<c:out value="${valueArray.message}" />

									<form method="post" action="removeAdd">
										<div style="margin-right: 10px;">
											<button class="btn btn-danger" type="submit" id="Supprimer"
												value="${valueArray.id}" name="Supprimer"
												style="cursor: pointer;">
												<i class="icon-trash icon-white"
													style="margin-right: 5px; margin-top: 1px;"></i> Supprimer
											</button>
										</div>
									</form>


								</div>
							</td>
							
							<td>		
								
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="footer">
			
			<a href="/tweetbook/home" class="btn btn-primary"
					data-toggle="modal"><b></b><i class="icon-home icon-white"
					style="margin-right: 5px; margin-top: 1px;"></i>Retour à l'accueil</a>
			</div>
		</div>
	</div>

	<!-- -------------------------------------------- -->
	<!-- ----MODAL D'AJOUT/SUPPRESSION DE MESSAGE---- -->
	<!-- -------------------------------------------- -->
	<jsp:include page="contact_add.jsp" />
	<jsp:include page="contact_delete.jsp" />
	<jsp:include page="adress_add.jsp" />	
	<jsp:include page="adress_delete.jsp" />	
	<!-- -------------------------------- -->
</body>
</html>
