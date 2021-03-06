package com.esiea.ihm.project.model;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
public class Contacts implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2402702922326122305L;

	public Contacts(String nom, String prenom, String email, String pseudo) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.pseudo = pseudo;
		this.email = email;
		this.id = 3;
		this.idAmis = new ArrayList<Integer>();
	}

	private String pseudo;
	
	private String prenom;

	private String nom;

	private String email;
	
	private String password;

	private Integer id;

	private ArrayList<Integer> idAmis;

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return nom + " " + prenom + " "
				+ email + " " + pseudo;
	}	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public ArrayList<Integer> getIdAmis() {
		return idAmis;
	}

	public void setIdAmis(ArrayList<Integer> idAmis) {
		this.idAmis = idAmis;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject toJSON() {
		JSONObject jObj = new JSONObject();
		jObj.put("pseudo", pseudo);
		jObj.put("prenom", prenom);
		jObj.put("nom", nom);
		jObj.put("email", email);
		jObj.put("id", id);
		
		JSONArray jArray = new JSONArray();
		Iterator<Integer> itr = idAmis.iterator();
		while(itr.hasNext())
			jArray.add(itr.next());
		
		jObj.put("idAdmis", jArray);
		return jObj;
	}
}
