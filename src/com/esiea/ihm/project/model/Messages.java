package com.esiea.ihm.project.model;

import java.io.Serializable;

public class Messages implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6912007124594625868L;

	private String message;
	
	private Integer id;
	
	private Integer idAuteur;
	
	private Integer idDestinateur;
	
	public Messages(String message) {
		super();
		this.message = message;
		this.id = 0;
		this.idAuteur= 0;
	}	

	public Integer getIdDestinateur() {
		return idDestinateur;
	}

	public void setIdDestinateur(Integer idDestinateur) {
		this.idDestinateur = idDestinateur;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getIdAuteur() {
		return idAuteur;
	}

	public void setIdAuteur(Integer idAuteur) {
		this.idAuteur = idAuteur;
	} 
}
