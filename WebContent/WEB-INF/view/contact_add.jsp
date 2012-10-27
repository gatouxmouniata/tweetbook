<!-- -------------------------------------------------------------- -->
<!------------------------ MODAL CONATACT ADD ------------------------>
<!-- -------------------------------------------------------------- -->
<div class="modal fade hide" id="contact_add_mod">
	<div class="modal-header">
		<a class="close" data-dismiss="modal">&times;</a>
		<h3 align="center">Authentification</h3>
	</div>
	<form id="contact_new" method="post" action="contact_add"
		class="form-horizontal">
		<div class="modal-body">
			<table style="margin: 0 auto;">
				<!-- ------------------- -->
				<!-- NEW CONTACT DETAILS -->
				<!-- ------------------- -->
				<tr>
					<td align="center">
						<label style="margin-bottom: 10px;font-size: 12px; color: red;">&curren;&curren;Veuillez renseigner tous les champs.&curren;&curren;</label>
						<hr>
						<label style="margin-left: 30px; font-weight: bold;">D&eacute;tails du contact:</label>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="nom">Pseudo:</label>
							<div class="controls">
								<input type="text" id="pseudo" name="pseudo" class="search-query" placeholder="Ex: CharlesLeBoGoss" 
								tabindex="1" autocomplete="off" style="text-transform: capitalize;" maxlength="50" required />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="nom">Nom:</label>
							<div class="controls">
								<input type="text" id="nom" name="nom" class="search-query" placeholder="Ex: Charles" 
								tabindex="1" autocomplete="off" style="text-transform: capitalize;" maxlength="50" required />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="prenom">Pr&eacute;nom:</label>
							<div class="controls">
								<input type="text" id="prenom" name="prenom" class="search-query" placeholder="Ex: Dupont"
									tabindex="2" autocomplete="off" style="text-transform: capitalize;" maxlength="50" required />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="email">Email:</label>
							<div class="controls">
								<input type="email" id="email" name="email" class="search-query" placeholder="exemple@domaine.com"
									tabindex="3" style="text-transform: none;" maxlength="60" required/>
							</div>
						</div>
						
						<div class="control-group">
							<label class="control-label" for="password">Password:</label>
							<div class="controls">
								<input type="password" id="password" name="password" class="search-query" placeholder="password"
									tabindex="3" style="text-transform: none;" maxlength="60" required/>
							</div>
						</div>
						
								
						<hr>
					</td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<input style="width: 110px" form="contact_new" type="submit" id="b_create_contact" 
				name="b_create_contact" class="btn btn-primary" value="Cr&eacute;er"/>
			<a class="btn btn-primary" style="width: 90px" data-dismiss="modal">Annuler</a>
		</div>
	</form>
</div>
<!------------------------ /MODAL ------------------------>