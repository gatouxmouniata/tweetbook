<!------------------------ MODAL DELETE ACCOUNT ------------------------>
<div id="contact_delete_mod" class="modal fade">
	<div class="modal-header">
		<a class="close" data-dismiss="modal" >&times;</a>
		<h3>Suppresion de contact</h3>
	</div>
	<div class="modal-body">
		<h4 style="text-align: center;">Ce contact et ses don&eacute;es/adresses seront supprim&eacute;es.<br>Voulez-vous continuer?</h4>
		<br>
	</div>   
	<div class="modal-footer" style="text-align: center;">
		<form method="post" action="remove">
        	<button class="btn btn-danger" type="submit" id="button_delete" value="" name="Supprimer" style="cursor: pointer;">
        		<i class="icon-trash icon-white" style="margin-right: 5px; margin-top: 1px;"></i>
        		Oui
        	</button>
        	<a class="btn btn-success" data-dismiss="modal" cursor: pointer;"><i class="icon-share-alt icon-white" style="margin-right: 5px; margin-top: 1px;"></i>Non</a>
       	</form>
	</div>
</div>
<!------------------------ /MODAL DELETE ACCOUNT ------------------------>
