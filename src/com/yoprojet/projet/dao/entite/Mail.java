package com.yoprojet.projet.dao.entite;

public class Mail {
private Long id;
private String objet;
private String message;
private Long distinataire;
private String priviligeDistinataire;
private Long emetteur;
private String priviligeEmetteur;
private String date;
private String status;
public Mail() {
	super();
}
public Mail(String objet, String message, Long distinataire,String priviligeDistinataire, Long emetteur,String priviligeEmetteur,
		String date, String status) {
	super();
	this.objet = objet;
	this.message = message;
	this.distinataire = distinataire;
	this.priviligeDistinataire=priviligeDistinataire;
	this.emetteur = emetteur;
	this.priviligeEmetteur=priviligeEmetteur;
	this.date = date;
	this.status = status;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getObjet() {
	return objet;
}
public void setObjet(String objet) {
	this.objet = objet;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}

public Long getDistinataire() {
	return distinataire;
}
public void setDistinataire(Long distinataire) {
	this.distinataire = distinataire;
}
public Long getEmetteur() {
	return emetteur;
}
public void setEmetteur(Long emetteur) {
	this.emetteur = emetteur;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getPriviligeEmetteur() {
	return priviligeEmetteur;
}
public void setPriviligeEmetteur(String priviligeEmetteur) {
	this.priviligeEmetteur = priviligeEmetteur;
}
public String getPriviligeDistinataire() {
	return priviligeDistinataire;
}
public void setPriviligeDistinataire(String priviligeDistinataire) {
	this.priviligeDistinataire = priviligeDistinataire;
}

}
