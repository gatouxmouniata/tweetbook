<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp" />
<title>Liste des messages</title>
</head>
<body>
	<div id="container">
		<div id="content">
			<div id="header">
			<table width="100%">
				<tr>
					<td width="50%" align="left">
						<h4>&nbsp;&nbsp;Liste des messages</h4>
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
					<c:forEach var="valueArray" items="${requestScope['messages']}">
						<tr style="border-bottom: inset 1px silver;">
							
							<td width="40%" align="left">
								<div style="margi-left: 15px">
									<p>
										&nbsp;&nbsp;<strong>Message: </strong>
									</p>
									<p>
										<c:out value="${valueArray.message}" />
									</p>
									
								</div>
							</td>
							
							
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="footer">
					<a href="#address_add_mod" class="btn btn-primary"
						data-toggle="modal"><i class="icon-list-alt icon-white"
						style="margin-right: 5px; margin-top: 1px;"></i>Publier un message</a>
					<a href="/tweetbook/homeFriends" class="btn btn-primary"
						data-toggle="modal"><i class="icon-user icon-white"
						style="margin-right: 5px; margin-top: 1px;"></i>Voir les ami(e)s</a>
			</div>
		</div>
	</div>

	<!-- -------------------------------------------- -->
	<!-- ----MODAL D'AJOUT/SUPPRESSION DE MESSAGE---- -->
	<!-- -------------------------------------------- -->
	<jsp:include page="adress_add.jsp" />
	<jsp:include page="adress_delete.jsp" />
	<!-- -------------------------------- -->
</body>
</html>
