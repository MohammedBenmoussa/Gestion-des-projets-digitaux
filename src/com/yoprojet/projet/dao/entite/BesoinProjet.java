package com.yoprojet.projet.dao.entite;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;


public class BesoinProjet 
{

private Long id;
private String description;
private Long idClient;
private String nomComplet;
private String nomCourt;
private Long idMetier;
private int coutEstime;
private double budget;
private int active;
private Long idChef;

private Set<Metier> metier=new HashSet<Metier>();

public BesoinProjet() 
{
	super();
}

public BesoinProjet(String description, Long idClient, String nomComplet, String nomCourt, Long idMetier,int coutEstime) {
	super();
	this.description = description;
	this.idClient = idClient;
	this.nomComplet = nomComplet;
	this.nomCourt = nomCourt;
	this.idMetier = idMetier;
	this.coutEstime=coutEstime;
}

public Long getId() {
	return id;
}

public void setId(Long id) {
	this.id = id;
}

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public Long getIdClient() {
	return idClient;
}

public void setIdClient(Long idClient) {
	this.idClient = idClient;
}

public String getNomComplet() {
	return nomComplet;
}

public void setNomComplet(String nomComplet) {
	this.nomComplet = nomComplet;
}

public String getNomCourt() {
	return nomCourt;
}

public void setNomCourt(String nomCourt) {
	this.nomCourt = nomCourt;
}

public Long getIdMetier() {
	return idMetier;
}

public void setIdMetier(Long idMetier) {
	this.idMetier = idMetier;
}

public int getCoutEstime() {
	return coutEstime;
}

public void setCoutEstime(int coutEstime) {
	this.coutEstime = coutEstime;
}

public double getBudget() {
	return budget;
}

public void setBudget(double budget) {
	this.budget = budget;
}

public Set<Metier> getMetier() {
	return metier;
}

public void setMetier(Set<Metier> metier) {
	this.metier = metier;
}

public int getActive() {
	return active;
}

public void setActive(int active) {
	this.active = active;
}

public Long getIdChef() {
	return idChef;
}

public void setIdChef(Long idChef) {
	this.idChef = idChef;
}


}
