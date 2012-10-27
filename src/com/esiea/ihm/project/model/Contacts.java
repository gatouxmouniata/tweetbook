package com.esiea.ihm.project.model;
import java.io.Serializable;
import java.util.ArrayList;
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
		this.id = 0;
	}

	private String pseudo;
	
	private String prenom;

	private String nom;

	private String email;

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
}
