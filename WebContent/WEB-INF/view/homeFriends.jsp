<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp" />
<title>Liste des ami(e)s</title>
</head>
<body>
	<div id="container">
		<div id="content">
			<div id="header">
			<table width="100%">
				<tr>
					<td width="50%" align="left">
						<h4>&nbsp;&nbsp;Liste des ami(e)s</h4>
					</td>
					<td align="right">
					<div style="margin-top: 10px; margin-right: 10px;">
						<form method="post" action="result_search">
							<input class="search-query" id="keys" placeholder="mot cl&eacute;" type="text" name="keys"/>
							<button class="btn btn-inverse" type="submit"><i class="icon-search icon-white" style="margin-right: 5px; margin-top: 1px;"></i></button>
						</form>
					</div>
					</td>
				</tr>
			</table>
			</div>
			<div id="contacts">
				<table class="table-striped caption" width="100%">
					<c:forEach var="valueArray" items="${requestScope['friends']}">
						<tr style="border-bottom: inset 1px silver;">
							<td width="25%" align="center" height="140px"><a
								href="javascript:document.forms[id='${valueArray.email}'].submit();"><img
									alt="contact_image" class="thumbnail" src="img/contact.jpg"
									style="margin-top: 0px; cursor: pointer;" width="80px"
									height="80px"
									title="Voir/Modifier <c:out value="${valueArray.nom}"/>" /></a></td>
							<td width="40%" align="left">
								<div style="margi-left: 15px">
									<p>
										&nbsp;&nbsp;<strong>Nom : </strong>
										<c:out value="${valueArray.nom}" />
									</p>
									<p>
										&nbsp;&nbsp;<strong>Pr&eacute;nom : </strong>
										<c:out value="${valueArray.prenom}" />
									</p>
									<p>
										&nbsp;&nbsp;<strong>Pseudo : </strong>
										<c:out value="${valueArray.pseudo}" />
									</p>
									<p>
										&nbsp;&nbsp;<strong>Email : </strong>
										<c:out value="${valueArray.email}" />
									</p>
								</div>
							</td>
							<td>
								<div style="margin-right: 10px;">
									<form method="POST" action="contact_details"
										id="${valueArray.email}">
										<input type="hidden" name="Update" value="${valueArray.id}" />
										<button class="btn btn-success" type="submit"
											style="margin-top: 10px; cursor: pointer;">
											<i class="icon-list-alt icon-white"
												style="margin-right: 5px; margin-top: 1px; cursor: pointer;"></i>
											Envoyer un message
										</button>
									</form>
									<a href="#contact_delete_mod" role="button"
										class="btn btn-danger" data-toggle="modal"
										onclick="setId(${valueArray.id});" style="cursor: pointer;"><i
										class="icon-trash icon-white"
										style="margin-right: 5px; margin-top: 1px;"></i>Supprimer</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="footer">
				<a href="#contact_add_mod" class="btn btn-primary"
					data-toggle="modal"><b>+</b><i class="icon-user icon-white"
					style="margin-right: 5px; margin-top: 1px;"></i>Ajouter un contact</a>
			</div>
		</div>
	</div>

	<!-- -------------------------------------------- -->
	<!-- ----MODAL D'AJOUT/SUPPRESSION DE CONTACT---- -->
	<!-- -------------------------------------------- -->
	<jsp:include page="contact_add.jsp" />
	<jsp:include page="contact_delete.jsp" />
	<!-- -------------------------------- -->
</body>
</html>