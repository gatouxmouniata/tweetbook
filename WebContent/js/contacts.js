function setId(contact_id){
	document.getElementById("button_delete").value=contact_id;
	document.getElementById("valider").value=contact_id;
}
function setIdDest(contact_id){
	document.getElementById("valider").value=contact_id;
}
function setAddrId(adress_id){
	document.getElementById("button_delete_addr").value=adress_id;
}
function checkActif(bool){
	if(bool == true){
		document.getElementById("actif").setAttribute("checked", "checked");
	}else{
		document.getElementById("actif").removeAttribute("checked");
	}
}
