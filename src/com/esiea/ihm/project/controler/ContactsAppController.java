package com.esiea.ihm.project.controler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpSession;

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
			@RequestParam("valider") String contactId,
			@RequestParam("message") String message, HttpSession session) {
		int id = Integer.parseInt(contactId);

		Messages mess = new Messages(message);

		Integer checkMess = 1;
		while (oldMapMessages.containsKey(checkMess)) {
			checkMess++;
		}
		mess.setId(checkMess);
		mess.setIdAuteur((Integer) session.getAttribute("ID"));
		if (id  == (Integer)session.getAttribute("ID"))
			mess.setIdDestinateur(0);
		else
			mess.setIdDestinateur(id);
		oldMapMessages.put(mess.getId(), mess);
		//return updateContactForm(model, contactId.toString());
		return "/home";
	}
	
	// FAIIIIIIIIIT Ajoute un nouveau contact à la map de contact et redirige vers la vue liste des contacts
	@RequestMapping(value = "/contact_add", method = RequestMethod.POST)
	public String addNewContact(@RequestParam("nom") String nom,
			@RequestParam("prenom") String prenom,
			@RequestParam("email") String email,
			@RequestParam("pseudo") String pseudo,
			@RequestParam("password") String password,
			Model model) {
		
		// Traitement des saisie du contacts (nom, prenom, email, pseudo)
		Contacts contact = new Contacts(nom, prenom, email, pseudo);
		contact.setPassword(password);
		Integer check = 1;
		if (oldMapContacts == null)
			oldMapContacts = new HashMap<Integer, Contacts>();
		while (oldMapContacts.containsKey(check)) {
			check++;
		} 
		contact.setId(check);
		oldMapContacts.put(check, contact);
		
		return "/login";
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
	public String removeContact(@RequestParam("Supprimer") String supprimer, HttpSession session) {
		oldMapContacts.get(session.getAttribute("ID")).getIdAmis().remove((Integer)Integer.parseInt(supprimer));
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
		public String showAll(Model model, HttpSession session) {
			//ArrayList<Messages> messagesArray = new ArrayList<Messages>();
			ArrayList<String> messagesFormated = new ArrayList<String>();
			Iterator<Integer> it = oldMapMessages.keySet().iterator();
			while (it.hasNext()) {
				Messages m = oldMapMessages.get(it.next());
				
				// Si le message est public ou si il m'est destiné ou si j'en suis l'auteur
				if(m.getIdDestinateur() == 0 || m.getIdDestinateur() == session.getAttribute("ID") || m.getIdAuteur() == session.getAttribute("ID"));
				{
					
						String message = null;
						
						// Si le message est public et ( que je suis amis avec l'auteur ou que j'en suis l'auteur )
						if(m.getIdDestinateur() == 0 && ( oldMapContacts.get(session.getAttribute("ID")).getIdAmis().contains(m.getIdAuteur()) || m.getIdAuteur() == session.getAttribute("ID") ))
						{	
							message = 	"<strong>"+oldMapContacts.get(m.getIdAuteur()).getPseudo()+":</strong>"
										+"<br>"
										+m.getMessage();
						}
						
						// Si je suis le destinataire du message
						else if(m.getIdDestinateur() == session.getAttribute("ID"))
						{
							message = 	"<strong>"+oldMapContacts.get(m.getIdAuteur()).getPseudo()+" (Privé):</strong>"
										+"<br>"
										+m.getMessage();
						}
						
						// Si je suis l'auteur du message
						else if(m.getIdAuteur() == session.getAttribute("ID"))
						{
							message = 	"<strong>"+oldMapContacts.get(m.getIdAuteur()).getPseudo()+" (Privé):</strong>"
									+"@"+oldMapContacts.get(m.getIdDestinateur()).getPseudo()
									+"<br>"
									+m.getMessage();
						}
						
						messagesFormated.add(message);
										
				}
			}
			model.addAttribute("messagesFormated",messagesFormated);
			model.addAttribute("contact", oldMapContacts.get(session.getAttribute("ID")));
			return "WEB-INF/view/home.jsp";
		}
		
		@RequestMapping(value = "/homeFriends")
		public String showAllFriends(Model model, HttpSession session) {
			ArrayList<Contacts> friendsArray = new ArrayList<Contacts>();
			Set<Integer> cles = oldMapContacts.keySet();
			Iterator<Integer> it = cles.iterator();
			
			Contacts contact = null; 
			
			while (it.hasNext()) {
				contact = oldMapContacts.get(it.next());
				if(oldMapContacts.get(session.getAttribute("ID")).getIdAmis().contains(contact.getId()))
					friendsArray.add(contact);
			}
						
			model.addAttribute("friends", friendsArray);
			model.addAttribute("contact", oldMapContacts.get(session.getAttribute("ID")));
			return "WEB-INF/view/homeFriends.jsp";
		}
		
		@RequestMapping(value = "/login_confirm")
		public String login_confirm(Model model,@RequestParam("pseudo") String pseudo, @RequestParam("password") String password, HttpSession session) {
			
			Set<Integer> cles = oldMapContacts.keySet();
			Iterator<Integer> it = cles.iterator();
			Contacts contact = null;
			while (it.hasNext()) {
				
				contact = oldMapContacts.get(it.next());
				if(contact.getPassword().compareTo(password)==0)
				{
					session.setAttribute("ID", contact.getId());
					return "/home";
				}
			}
						
	
			return "/login";
		}
		
		
		@RequestMapping(value = "/showAllUser")
		public String showAllUsers(Model model, HttpSession session) {
			ArrayList<Contacts> friendsArray = new ArrayList<Contacts>();
			Set<Integer> cles = oldMapContacts.keySet();
			Iterator<Integer> it = cles.iterator();
			
			Contacts contact = null; 
			
			while (it.hasNext()) {
				contact = oldMapContacts.get(it.next());
				if(!oldMapContacts.get(session.getAttribute("ID")).getIdAmis().contains(contact.getId()) && contact.getId() != session.getAttribute("ID"))
					friendsArray.add(contact);
			}
						
			model.addAttribute("friends", friendsArray);
			model.addAttribute("contact", oldMapContacts.get(session.getAttribute("ID")));
			return "WEB-INF/view/alluser.jsp";
		}
		

		@RequestMapping(value = "/addFriend")
		public String addFriend(Model model, HttpSession session, @RequestParam("Valider") Integer contactID) {
			
			oldMapContacts.get(session.getAttribute("ID")).getIdAmis().add(contactID);
	
			return "/homeFriends";
		}
		
		
}
