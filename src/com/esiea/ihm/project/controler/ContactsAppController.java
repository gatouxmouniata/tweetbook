package com.esiea.ihm.project.controler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.esiea.ihm.project.model.Contacts;
import com.esiea.ihm.project.model.Messages;

@Controller
public class ContactsAppController {
	public HashMap<Integer, Contacts> oldMapContacts = new HashMap<Integer, Contacts>();
	private HashMap<Integer, Messages> oldMapMessages = new HashMap<Integer, Messages>();
	
	Contacts user = new Contacts("Nom", "Prenom", "Email", "Pseudo");
	public String id;
	
	
	// FAIIIIIIITTTTTTTTTTTTTTT Ajoute un nouveau message dans la map message en fonction des entrees utilisateurs
	@RequestMapping(value = "/addNewMessage", method = RequestMethod.POST)
	public String addNewMessage(Model model,
			@RequestParam("Valider") String contactId,
			@RequestParam("message") String message) {
		
		Messages mess = new Messages(message);
		
		// TRES SALE ------------------------------------------------------------------
		//-----crÈer un id qui s'incrÈmente ---------------------------------------
		//------------------------------------------------------------------
		Integer checkMess = 1;
		while (oldMapMessages.containsKey(checkMess)) {
			checkMess++;
		}
		mess.setId(checkMess);
		mess.setIdAuteur(Integer.parseInt(contactId));
		oldMapMessages.put(mess.getId(), mess);

		//return updateContactForm(model, contactId.toString());
		return "/home";
	}

	// Redirige vers le formulaire d'ajout d'une adress à un contact en gardant l'id du contact dans une variable
	@RequestMapping(value = "/addNewAdressForm", method = RequestMethod.POST)
	public String addNewMessageForm(Model model,
			@RequestParam("AddNewAdressForm") String contactId) {
		
		model.addAttribute("contactId", contactId);
		return "WEB-INF/view/formNewAdd.jsp";

	}

	
	// FAIIIIIIIIIT Ajoute un nouveau contact à la map de contact et redirige vers la vue liste des contacts
	@RequestMapping(value = "/contact_add", method = RequestMethod.POST)
	public String addNewContact(@RequestParam("nom") String nom,
			@RequestParam("prenom") String prenom,
			@RequestParam("email") String email,
			@RequestParam("pseudo") String pseudo,
			Model model) {
		
		// Traitement des saisie du contacts (nom, prenom, email, pseudo)
		Contacts contact = new Contacts(nom, prenom, email, pseudo);
		HashMap<Integer, Contacts> oldMapContacts = this.oldMapContacts;
		Integer check = 1;
		if (oldMapContacts == null)
			oldMapContacts = new HashMap<Integer, Contacts>();
		while (oldMapContacts.containsKey(check)) {
			check++;
		}
		contact.setId(check);
		oldMapContacts.put(check, contact);
		
		return "/home";
	}

	// FAIIIIIIIIT Efface les messages liee a un contact donnee ( Utiliser en cas d'effacement d'un contact)
	public void deleteMessagesByContactId(Integer IdContact) {
		HashMap<Integer, Messages> testMess = this.oldMapMessages;
		Set<Integer> clesMess = testMess.keySet();
		Iterator<Integer> itMess = clesMess.iterator();
		
		while (itMess.hasNext()) {
			Integer i = 0;
			i = itMess.next();

			if (testMess.get(i).getIdAuteur().compareTo(IdContact) == 0) {
				testMess.remove(i);
				clesMess = testMess.keySet();
				itMess = clesMess.iterator();

			}
		}
	
	}

	// FAIIIIIIITT Retourne la liste des messages d'un contact donnee ( Utiliser pour l'affichage des details d'un contact
	public ArrayList<Messages> getMessagesByContactId(Integer IdContact) {
		
		HashMap<Integer, Messages> testMess = this.oldMapMessages;
		ArrayList<Messages> messagesArray = new ArrayList<Messages>();
		Set<Integer> clesAddr = testMess.keySet();
		Iterator<Integer> itAddr = clesAddr.iterator();
		while (itAddr.hasNext()) {
			int i = itAddr.next();

			if (testMess.get(i).getIdAuteur().compareTo(IdContact) == 0) {
				messagesArray.add(testMess.get(i));
			}
		}
		return messagesArray;
	}

	//FAIIIIIIITTTTTTT Efface un message donne ( Utiliser pour supprimer un message dans les details d'un contact )
	@RequestMapping(value = "/removeAdd", method = RequestMethod.POST)
	public String removeMessages(Model model,
			@RequestParam("Supprimer") String supprimer) {
		HashMap<Integer, Messages> messMap = this.oldMapMessages;
		Integer contactId = messMap.get(Integer.parseInt(supprimer)).getIdAuteur();
		messMap.remove(Integer.parseInt(supprimer));

		return updateContactForm(model, contactId.toString());
	}

	// FAIIIIIIIIITT Supprime un contact et les messages qui lui sont lies
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removeContact(@RequestParam("Supprimer") String supprimer) {
		HashMap<Integer, Contacts> test = this.oldMapContacts;
		deleteMessagesByContactId(Integer.parseInt(supprimer));
		test.remove(Integer.parseInt(supprimer));
		return "/home";
	}

	// FAIIIIITTTTT
	// Effectue une recherche de mot clé dans la map de contact
	// Renvoi une arraylist de contact correspondant sur la page d'affichage de la liste des contacts
	@RequestMapping(value = "/result_search")
	public String search(Model model, @RequestParam("keys") String keys) {
		HashMap<Integer, Contacts> test = this.oldMapContacts;
		ArrayList<Contacts> contactsArray = new ArrayList<Contacts>();
		Set<Integer> cles = test.keySet();
		Iterator<Integer> it = cles.iterator();
		while (it.hasNext()) {
			int i = it.next();
			if (test.get(i).toString().toUpperCase()
					.matches(".*" + keys.toUpperCase() + ".*"))
				contactsArray.add(test.get(i));
		}
		model.addAttribute("contact", contactsArray);
		return "WEB-INF/view/home.jsp";
	}

	//FAIIIIIIIITTTTTTT
	// Met a jour une adresse donnée.
	// Récupere l'ensemble des champs d'un formulaire de mise a jour et met a jour le model
	// Renvoie sur la page des details du contact associé 
	@RequestMapping(value = "/recupAndUpdateAdd", method = RequestMethod.POST)
	public String updateMessage(Model model,
			@RequestParam("Update") String update,
			@RequestParam("message") String message) {

		Messages mess = new Messages(message);
		HashMap<Integer, Messages> oldMapMessages = this.oldMapMessages;
		Integer contactId = oldMapMessages.get(Integer.parseInt(update)).getIdAuteur();
		mess.setId(Integer.parseInt(update));
		mess.setIdAuteur(contactId);
		oldMapMessages.put(Integer.parseInt(update), mess);
		return updateContactForm(model, contactId.toString());
	}

	// Renvoie sur le formulaire de mise a jour d'une adresse donnée
	//FAIIIITTTTTT
	@RequestMapping(value = "/updateAdd", method = RequestMethod.POST)
	public String updateAdresseForm(Model model,
			@RequestParam("Update") String update) {

		HashMap<Integer, Messages> oldMapMessages = this.oldMapMessages;
		model.addAttribute("message", oldMapMessages.get(Integer.parseInt(update)));
		return "WEB-INF/view/updateAdd.jsp";
	}

	//FAIIIIIIIIIIIIIITTTT
	// Recupere les infos saisie par l'utilisateur sur le formulaire de mise a jour du contact
	// Met a jour le model avec les modifications
	@RequestMapping(value = "/recupAndUpdate", method = RequestMethod.POST)
	public String updateContact(@RequestParam("nom") String nom,
			@RequestParam("prenom") String prenom,
			@RequestParam("Update") String update,
			@RequestParam("email") String email,
			@RequestParam("pseudo") String pseudo,
			Model model) {

		Contacts contact = new Contacts(nom, prenom, email, pseudo);
		HashMap<Integer, Contacts> oldMapContacts = this.oldMapContacts;
		contact.setId(Integer.parseInt(update));
		oldMapContacts.put(Integer.parseInt(update), contact);
		return "/contact_details";
	}

	// Renvoi sur le details d'un contact
	// Permet l'affichage de la liste des adresse et des champs nom, prenom.. etc du contact modifiable
	//FAIIIIIIIITTTTT
	@RequestMapping(value = "/contact_details", method = RequestMethod.POST)
	public String updateContactForm(Model model,
			@RequestParam("Update") String update) {
		this.id = update;
		HashMap<Integer, Contacts> test = this.oldMapContacts;
		model.addAttribute("contact", test.get(Integer.parseInt(update)));
		
		return "WEB-INF/view/contact_details.jsp";
	}
	
	//FAIIIIIIIIITTTT
		// Affiche l'ensemble des contacts 
		// Récupre l'ensemble des données du model et renvoie une arraylist a la page d'affichage de la liste de contact
		@RequestMapping(value = "/home")
		public String showAll(Model model) {
			/*HashMap<Integer, Contacts> test = this.oldMapContacts;
			ArrayList<Contacts> contactsArray = new ArrayList<Contacts>();
			Set<Integer> cles = test.keySet();
			Iterator<Integer> it = cles.iterator();
			while (it.hasNext()) {
				contactsArray.add(test.get(it.next()));
			}*/

			ArrayList<Messages> messagesArray = new ArrayList<Messages>();
			Iterator<Integer> it = oldMapMessages.keySet().iterator();
			while (it.hasNext()) {
				messagesArray.add(oldMapMessages.get(it.next()));
			}
			
			model.addAttribute("messages", messagesArray);
			model.addAttribute("contact", user);
			return "WEB-INF/view/home.jsp";
		}
		
		@RequestMapping(value = "/homeFriends")
		public String showAllFriends(Model model) {
			Contacts c =new Contacts("ami1", "ami1", "ami1", "ami1");
			Contacts c2 =new Contacts("ami2", "ami2", "ami2", "ami2");
			
			Integer check = 1;
			if (oldMapContacts == null)
				oldMapContacts = new HashMap<Integer, Contacts>();
			while (oldMapContacts.containsKey(check)) {
				check++;
			}
			c.setId(check);
			oldMapContacts.put(check, c);
			check = 1;
			if (oldMapContacts == null)
				oldMapContacts = new HashMap<Integer, Contacts>();
			while (oldMapContacts.containsKey(check)) {
				check++;
			}
			c2.setId(check);
			oldMapContacts.put(check, c2);
			
			
			ArrayList<Contacts> friendsArray = new ArrayList<Contacts>();
			Set<Integer> cles = oldMapContacts.keySet();
			Iterator<Integer> it = cles.iterator();
			while (it.hasNext()) {
				friendsArray.add(oldMapContacts.get(it.next()));
			}
						
			model.addAttribute("friends", friendsArray);
			model.addAttribute("contact", user);
			return "WEB-INF/view/homeFriends.jsp";
		}
}
