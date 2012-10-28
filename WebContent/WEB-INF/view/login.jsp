<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp" />
<title>Identifiez vous</title>
</head>
<body>
	<div id="container">
		<div id="content">
			<div id="header">
				<table width="100%">
					<tr>
						<td width="50%" align="left">
							<h4>&nbsp;&nbsp;Identifiez vous</h4>
						</td>
						<td align="right">
							<div style="margin-top: 10px; margin-right: 10px;"></div>
						</td>
					</tr>
				</table>
			</div>

			<br>


			<form id="login" method="post" action="login_confirm"
				class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="nom">Pseudo:</label>
					<div class="controls">
						<input type="text" id="pseudo" name="pseudo" class="search-query"
							placeholder="login" tabindex="1" autocomplete="off"
							style="text-transform: capitalize;" maxlength="50" required />
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="nom">Password:</label>
					<div class="controls">
						<input type="password" id="password" name="password"
							class="search-query" placeholder="password" tabindex="1"
							autocomplete="off" style="text-transform: capitalize;"
							maxlength="50" required />
							
							<input style="width: 110px" form="login" type="submit"
					id="b_create_contact" name="b_create_contact"
					class="btn btn-primary" value="validez" />
					</div>
				</div>
			</form>

			<br>
			
			



			<div id="footer">

				<a href="#contact_add_mod" class="btn btn-primary"
					data-toggle="modal"><b>+</b><i class="icon-user icon-white"
					style="margin-right: 5px; margin-top: 1px;"></i>Creer un compte</a>
			</div>
		</div>
	</div>

	<!-- -------------------------------------------- -->
	<!-- ----MODAL D'AJOUT/SUPPRESSION DE MESSAGE---- -->
	<!-- -------------------------------------------- -->
	<jsp:include page="adress_add.jsp" />
	<jsp:include page="adress_delete.jsp" />
		<jsp:include page="contact_add.jsp" />
	<jsp:include page="contact_delete.jsp" />
	<!-- -------------------------------- -->
</body>
</html>
