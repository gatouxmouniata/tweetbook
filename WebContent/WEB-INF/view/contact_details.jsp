<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.esiea.ihm.project.model.Contacts"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<title>Details Contact</title>
</head>
<body onload="checkActif(${contact.actif});">
	<div id="details">
		<div id="header">
			<table width="100%">
				<tr>
					<td width="60%" align="left">
						<h4>&nbsp;&nbsp;D&eacute;tails de <span style="text-transform: uppercase;"><c:out value="${contact.nom}"/></span>&nbsp;<span style="text-transform: capitalize;"><c:out value="${contact.prenom}"/></span></h4>
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
		<div id="contact" style="margin-top: 10px;">
			<form method="post" action="recupAndUpdate" id="update">
				<table class="caption" width="100%" style="border-top: solid 2px silver;" cellspacing="20">
					<tr style="border-bottom: inset 1px silver;">
						<td width="30%" align="center">
							<img alt="contact_image" class="thumbnail" src="img/contact.jpg" style="margin-top: 0px; border: groove 2px orange;" width="150px" height="160px" title="Consulter <c:out value="${valueArray.id}"/>"/>
				    	</td>
				    	<td width="50%" align="left">
				    		<div style="margi-left: 15px">
				    			<div class="input-prepend">
		  							<span class="add-on" style="width: 130px;">Nom:</span>
		  							<input  class="span2" id="nom" name="nom" style="width: 250px;" autocomplete="off" maxlength="50" type="text" value="${contact.nom}">
		  						</div>
				    			<div class="input-prepend">
		  							<span class="add-on" style="width: 130px;">Pr&eacute;nom:</span>
		  							<input class="span2" id="prenom" name="prenom" style="width: 200px;" autocomplete="off" maxlength="50" type="text" value="${contact.prenom}">
		  						</div>
				    			<div class="input-prepend">
		  							<span class="add-on" style="width: 130px;">Email:</span>
		  							<input class="span2" id="email" name="email" style="width: 150px;" maxlength="60" type="email" value="${contact.email}">
		  						</div>
				    			<div class="input-prepend">
		  							<span class="add-on" style="width: 130px;">Date de naissance:</span>
		  							<input class="span2" id="date" name="date" style="width: 70px;" autocomplete="off" maxlength="10" type="text" value="${contact.dateString}">
		  						</div>
				    			<div class="input-prepend">
		  							<span class="add-on" style="width: 130px;">Actif:</span>
		  							<input class="span2" id="actif" name="actif" type="checkbox">
		  						</div>
				    		</div>
						</td>
				    	<td align="left">
				    		<a href="#contact_delete_mod" role="button"
										class="btn btn-danger" data-toggle="modal"
										onclick="setId(${contact.id});" style="cursor: pointer; width:100px; height: 20px; "><i
										class="icon-trash icon-white"
										style="margin-right: 5px; margin-top: 1px;"></i>Supprimer</a>
					  		<a class="btn btn-primary" href="home" style="width: 100px; height: 20px; margin-top: 8px;"><i class="icon-home icon-white" style="margin-right: 5px; margin-top: 1px;"></i>Accueil</a>
				  			<button class="btn btn-success" form="update" style="width: 130px; height: 30px; margin-top: 8px;" type="submit" value="${contact.id}" name="Update"><i class="icon-edit icon-white" style="margin-right: 5px; margin-top: 1px;"></i>Mettre &agrave; jour</button>
				    	</td>
					</tr>
				</table>
			</form>
		</div>
		<div id="adresses">
			<div class="accordion" id="accordion2">
				<c:forEach var="adress" items="${requestScope['address']}">
					<div class="accordion-group" style="border: groove 2px orange;">
						<div class="accordion-heading">
							<a style="text-decoration:none;" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#${adress.id}">
								<strong>Adresse <c:out value="${adress.id}"/></strong>
							</a>
						</div>
						<div id="${adress.id}" class="accordion-body">
							<div class="accordion-inner" style="border-top: dotted 1px orange;">
								<form method="POST" class="well form-search" action="recupAndUpdateAdd">
									<input type="text" maxlength="3" value="${adress.numero}" autocomplete="off" class="input-medium search-query" name="num" required/>
									<input type="text" maxlength="120" value="${adress.rue}" autocomplete="off" class="input-medium search-query" name="rue" required/>
									<input type="text" maxlength="10" value="${adress.codePostal}" autocomplete="off" class="input-medium search-query" name="code" required/>
									<input type="text" maxlength="40" value="${adress.ville}" autocomplete="off" class="input-medium search-query" name="ville" required/>
									<div id="bts" style="text-align: center; margin-top: 10px;">
										<button class="btn btn-primary" type="submit" id="Update" name="Update" value="${adress.id}" style="width: 100px;"><i
										class="icon-edit icon-white"
										style="margin-right: 5px; margin-top: 1px;"></i>Modifier</button>
										<a href="#adress_delete_mod" role="button"
											class="btn btn-danger" data-toggle="modal"
											onclick="setAddrId(${adress.id});" style="cursor: pointer;"><i
											class="icon-trash icon-white"
											style="margin-right: 5px; margin-top: 1px;"></i>Supprimer</a>
									</div>
								</form>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
		<div id="footer">
			<a href="#address_add_mod" class="btn btn-primary"
						data-toggle="modal"><b>+</b><i class="icon-list-alt icon-white"
						style="margin-right: 5px; margin-top: 1px;"></i>Ajouter une adresse</a>
				<%-- <button type="submit" value="${contact.id}" name="AddNewAdressForm">Ajouter une adresse</button> --%>
		</div>
	</div>
	</div>
	<!-- ------------------------------------------------------- -->
	<!-- ----MODAL D'AJOUT D'ADDRESSE/SUPPRESSION DE CONTACT---- -->
	<!-- ------------------------------------------------------- -->
	<jsp:include page="adress_add.jsp" />
	<jsp:include page="adress_delete.jsp" />	
	<jsp:include page="contact_delete.jsp" />
	<!-- -------------------------------- -->
</body>
</html>