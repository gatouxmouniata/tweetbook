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

				<tr>
					<td>
						
						<div class="control-group">
							<label class="control-label" for="message">Message:</label>
							<div class="controls">
						
								<textarea type="text" id="message" name="message" class="search-query" placeholder="write your message"
									tabindex="2" style="text-transform: none;" maxlength="120" rows="3" required></textarea>
						
							</div> 
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn btn-success" type="submit" id="valider" value="" name="valider" style="cursor: pointer;">
        		<i class="icon-list-alt icon-white" style="margin-right: 5px; margin-top: 1px;"></i>
        		valider
        	</button>
			<a class="btn btn-danger" style="width: 90px" data-dismiss="modal">Annuler</a>
		</div>
	</form>
</div>
<!------------------------ /MODAL ------------------------>