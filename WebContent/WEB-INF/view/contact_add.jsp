<!-- -------------------------------------------------------------- -->
<!------------------------ MODAL CONATACT ADD ------------------------>
<!-- -------------------------------------------------------------- -->
<div class="modal fade hide" id="contact_add_mod">
	<div class="modal-header">
		<a class="close" data-dismiss="modal">&times;</a>
		<h3 align="center">Ajout d'un contact</h3>
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
							<label class="control-label" for="date">Date:</label>
							<div class="controls">		
								<input  type="text" id="date" name="date" class="search-query" placeholder="dd/mm/aaaa"
									tabindex="4" autocomplete="off" style="text-transform: none;" maxlength="10" required/>
							</div> 
						</div>
						<div class="control-group">
							<div class="controls">
								<label class="checkbox">
									<input id="actif" name="actif" type="checkbox" tabindex="5">Actif&nbsp;/&nbsp;Inactif
								</label>
							</div>
						</div>		
						<hr>
					</td>
				</tr>
				<!-- ------------------- -->
				<!-- NEW ADDRESS DETAILS -->
				<!-- ------------------- -->
				<tr>
					<td align="center">
						<label style="margin-left: 30px; font-weight: bold;">Adresse principale:</label>
					</td>
				</tr>
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="num">Num&deg;:</label>
							<div class="controls">		
								<input  type="text" id="num" name="num" class="search-query" placeholder="45"
									tabindex="6" autocomplete="off" style="text-transform: none; width: 30px;" maxlength="3" required/>
							</div> 
						</div>
						<div class="control-group">
							<label class="control-label" for="rue">Voie:</label>
							<div class="controls">		
								<input  type="text" id="rue" name="rue" class="search-query" placeholder="rue de la paix"
									tabindex="7" autocomplete="off" style="text-transform: capitalize;" maxlength="120" required/>
							</div> 
						</div>
						<div class="control-group">
							<label class="control-label" for="code">Code postal:</label>
							<div class="controls">		
								<input  type="text" id="code" name="code" class="search-query" placeholder="75018"
									tabindex="8" autocomplete="off" style="text-transform: capitalize; width: 90px;" maxlength="10" required/>
							</div> 
						</div>
						<div class="control-group">
							<label class="control-label" for="ville">Ville:</label>
							<div class="controls">		
								<input type="text" id="ville" name="ville" class="search-query" placeholder="Paris"
									tabindex="9" autocomplete="off" style="text-transform: capitalize;" maxlength="40" required/>
							</div> 
						</div>
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