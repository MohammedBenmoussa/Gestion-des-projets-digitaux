package com.yoprojet.projet.dao.entite;

public class Paiement {
private Long id;
private long idClient;
private long idProjet;
private long idChef;
private long montant;
private String date;
private String tx;
public Paiement() {
	super();
}
public Paiement(long idClient, long idProjet, long idChef, long montant,
		String date, String tx) {
	super();
	this.idClient = idClient;
	this.idProjet = idProjet;
	this.idChef = idChef;
	this.montant = montant;
	this.date = date;
	this.tx = tx;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public long getIdClient() {
	return idClient;
}
public void setIdClient(long idClient) {
	this.idClient = idClient;
}
public long getIdProjet() {
	return idProjet;
}
public void setIdProjet(long idProjet) {
	this.idProjet = idProjet;
}
public long getIdChef() {
	return idChef;
}
public void setIdChef(long idChef) {
	this.idChef = idChef;
}
public long getMontant() {
	return montant;
}
public void setMontant(long montant) {
	this.montant = montant;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getTx() {
	return tx;
}
public void setTx(String tx) {
	this.tx = tx;
}

}
