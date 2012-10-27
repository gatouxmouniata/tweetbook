<!------------------------ MODAL DELETE ACCOUNT ------------------------>
<div id="adress_delete_mod" class="modal fade">
	<div class="modal-header">
		<a class="close" data-dismiss="modal" >&times;</a>
		<h3>Suppresion d'adresse</h3>
	</div>
	<div class="modal-body">
		<h4 style="text-align: center;">Vueillez confirmer la supperssion de cette adresse</h4>
		<br>
	</div>   
	<div class="modal-footer" style="text-align: center;">
		<form method="post" action="removeAdd">
        	<button class="btn btn-danger" type="submit" id="button_delete_addr" value="" name="Supprimer" style="cursor: pointer;"><i class="icon-trash icon-white" style="margin-right: 5px; margin-top: 1px;"></i>Oui</button>
        	<a class="btn btn-success" data-dismiss="modal" cursor: pointer;"><i class="icon-share-alt icon-white" style="margin-right: 5px; margin-top: 1px;"></i>Non</a>
       	</form>
	</div>
</div>
<!------------------------ /MODAL DELETE ACCOUNT ------------------------>
