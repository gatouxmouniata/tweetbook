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


	// Ajoute un nouveau message dans la map message en fonction des entrees utilisateurs
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

	// Ajoute un nouveau contact à la map de contact et redirige vers la page de login
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


	// Retourne la liste des messages d'un contact donnee ( Utiliser pour l'affichage des details d'un contact
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

	// Effectue une recherche de mot clé dans la map de contact
	// Renvoi une arraylist de contact correspondant sur la page d'affichage de la liste des contacts
	@RequestMapping(value = "/result_search")
	public String search(Model model, @RequestParam("keys") String keys, HttpSession session) {
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
		model.addAttribute("friends", contactsArray);
		model.addAttribute("contact", oldMapContacts.get(session.getAttribute("ID")));

		return "WEB-INF/view/alluser.jsp";
	}
	

	
	// Affiche les messages destiné ou rédiger par l'utilisateur
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


	@RequestMapping(value = "/printContactsJSON")
	public String printContactsJSON(Model model) {
		ArrayList<String> json = new ArrayList<String>();
		for (Integer key : oldMapContacts.keySet()) {
			json.add(oldMapContacts.get(key).toJSON().toString());
		}

		model.addAttribute("JSON", json);
		return "WEB-INF/view/printJSON.jsp";
	}

	@RequestMapping(value = "/printMessagesJSON")
	public String printMessagesJSON(Model model) {
		ArrayList<String> json = new ArrayList<String>();
		for (Integer key : oldMapMessages.keySet()) {
			json.add(oldMapMessages.get(key).toJSON().toString());
		}

		model.addAttribute("JSON", json);
		return "WEB-INF/view/printJSON.jsp";
	}

	
	@RequestMapping(value = "/showAllMyMessages")
	public String showMessages(Model model, HttpSession session)
	{
		model.addAttribute("message",getMessagesByContactId((Integer)session.getAttribute("ID")));
		return "WEB-INF/view/messagebycontact.jsp";
	}

@RequestMapping(value = "/removeAdd", method = RequestMethod.POST)
public String removeMessages(Model model,
		@RequestParam("Supprimer") String supprimer, HttpSession session) {
	HashMap<Integer, Messages> messMap = this.oldMapMessages;
	messMap.remove(Integer.parseInt(supprimer));
	return "/showAllMyMessages";
}

	

}
