<!-- -------------------------------------------------------------- -->
<!------------------------ MODAL CONATACT ADD ------------------------>
<!-- -------------------------------------------------------------- -->
<div class="modal fade hide" id="address_add_mod">
	<div class="modal-header">
		<a class="close" data-dismiss="modal">&times;</a>
		<h3 align="center">Publication d'un message</h3>
	</div>
	<form id="message_new" method="post" action="addNewMessage"
		class="form-horizontal">
		<div class="modal-body">
			<table style="margin: 0 auto;">
				<!-- ------------------- -->
				<!-- NEW MESSAGE DETAILS -->
				<!-- ------------------- -->
				<!-- <tr>
					<td align="center">
						<label style="margin-left: 30px; font-weight: bold;">Adresse principale:</label>
					</td>
				</tr>
				 -->
				<tr>
					<td>
						<div class="control-group">
							<label class="control-label" for="keyword">Keyword:</label>
							<div class="controls">		
								<input  type="text" id="keyword" name="keyword" class="search-query" placeholder="keyword"
									tabindex="1" autocomplete="off" style="text-transform: none; width: 60px;"/>
							</div> 
						</div>
						<div class="control-group">
							<label class="control-label" for="message">Message:</label>
							<div class="controls">
								<textarea type="text" id="message" name="message" class="search-query" placeholder="write your message"
									tabindex="2" style="text-transform: none;" maxlength="120" rows="3" required></textarea>
								<!-- <input  type="text" id="message" name="message" class="search-query" placeholder="write your message"
									tabindex="2" autocomplete="off" style="text-transform: capitalize;" maxlength="120" required/> -->
							</div> 
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn btn-primary" style="width: 110px" form="message_new" type="submit" value="${contact.id}" name="Valider">
				<i class="icon-ok icon-white" style="margin-right: 5px; margin-top: 1px;"></i>
				Publier
			</button>
			<a class="btn btn-primary" style="width: 90px" data-dismiss="modal"><b>&times;</b>Annuler</a>
		</div>
	</form>
</div>
<!------------------------ /MODAL ------------------------>