package com.yoprojet.projet.dao.entite;

public class Tache {
private Long idTache;
private String libelle;
private String dateD;
private String dateF;
private String status;
private Long idChef;
private Long idCollaborateur;
private Long idProjet;
private String description;
public Tache() {
	super();
}
public Tache(String libelle, String dateD, String dateF, String status,
		Long idChef, Long idCollaborateur, Long idProjet,String description) {
	super();
	this.libelle = libelle;
	this.dateD = dateD;
	this.dateF = dateF;
	this.status = status;
	this.idChef = idChef;
	this.idCollaborateur = idCollaborateur;
	this.idProjet = idProjet;
	this.description=description;
}
public Long getIdTache() {
	return idTache;
}
public void setIdTache(Long idTache) {
	this.idTache = idTache;
}
public String getLibelle() {
	return libelle;
}
public void setLibelle(String libelle) {
	this.libelle = libelle;
}
public String getDateD() {
	return dateD;
}
public void setDateD(String dateD) {
	this.dateD = dateD;
}
public String getDateF() {
	return dateF;
}
public void setDateF(String dateF) {
	this.dateF = dateF;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Long getIdChef() {
	return idChef;
}
public void setIdChef(Long idChef) {
	this.idChef = idChef;
}
public Long getIdCollaborateur() {
	return idCollaborateur;
}
public void setIdCollaborateur(Long idCollaborateur) {
	this.idCollaborateur = idCollaborateur;
}
public Long getIdProjet() {
	return idProjet;
}
public void setIdProjet(Long idProjet) {
	this.idProjet = idProjet;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}


}
