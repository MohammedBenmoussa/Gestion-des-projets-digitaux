package com.yoprojet.projet.dao.entite;



public class Metier {

private Long id;
private String technologie;

private BesoinProjet projet;
public Metier() {
	super();
	// TODO Auto-generated constructor stub
}
public Metier(String technologie) {
	super();
	this.technologie = technologie;
	projet=new BesoinProjet();
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getTechnologie() {
	return technologie;
}
public void setTechnologie(String technologie) {
	this.technologie = technologie;
}
public BesoinProjet getProjet() {
	return projet;
}
public void setProjet(BesoinProjet projet) {
	this.projet = projet;
}

}
