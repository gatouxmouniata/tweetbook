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
						<h4>&nbsp;&nbsp;Identifier vous</h4>
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
			
				<div class="control-group">
						<label class="control-label" for="nom">Pseudo:</label>
						<div class="controls">
							<input type="text" id="pseudo" name="pseudo" class="search-query" placeholder="Ex: CharlesLeBoGoss" 
							tabindex="1" autocomplete="off" style="text-transform: capitalize;" maxlength="50" required />
						</div>
				</div>
				
				<div class="control-group">
						<label class="control-label" for="nom">Password:</label>
						<div class="controls">
							<input type="password" id="password" name="password" class="search-query" placeholder="Ex: CharlesLeBoGoss" 
							tabindex="1" autocomplete="off" style="text-transform: capitalize;" maxlength="50" required />
						</div>
				</div>
			
			</div>

		</div>
	</div>


</body>
</html>
