package com.esiea.ihm.project.controler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForwardController {

	@RequestMapping(value = "/addcontact")
	public String addContactForm() {
	        System.out.println("Redirection sur l'ajout de contact...");
	        return "WEB-INF/view/form.jsp";
	    }
	
	@RequestMapping(value="/recherche")
	public String researchForm(){
		 System.out.println("Redirection sur la page de recherche...");
		return "WEB-INF/view/formSearch.jsp";
	}
	
	@RequestMapping(value="/login")
	public String login(){
		 System.out.println("Redirection sur la page de login...");
		return "WEB-INF/view/login.jsp";
	}
		
	
}
