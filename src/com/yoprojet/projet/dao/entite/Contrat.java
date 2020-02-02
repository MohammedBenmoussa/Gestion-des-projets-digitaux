package com.yoprojet.projet.dao.entite;

public class Contrat {
private Long id;
private Long numC;
private  String dateC;
private String idProjet;
public Contrat() {
	super();
	// TODO Auto-generated constructor stub
}
public Contrat(Long numC, String dateC, String idProjet) {
	super();
	this.numC = numC;
	this.dateC = dateC;
	this.idProjet = idProjet;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public Long getNumC() {
	return numC;
}
public void setNumC(Long numC) {
	this.numC = numC;
}
public String getDateC() {
	return dateC;
}
public void setDateC(String dateC) {
	this.dateC = dateC;
}
public String getIdProjet() {
	return idProjet;
}
public void setIdProjet(String idProjet) {
	this.idProjet = idProjet;
}

}
