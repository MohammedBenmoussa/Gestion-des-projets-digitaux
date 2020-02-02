package com.yoprojet.projet.dao.entite;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
public class Client implements Serializable		
{
	private Long id;
	private String prenom;
	private String nom;
	private String email;
	private String password;
	private String privilige;
	private String type;
	private String nomSociete;
	private String registre;
	private String identifiant;
	private String adrssse;
	private String code;
	private String secteur;
	private String typeSociete;
	private String avatar;
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Client(String email, String password, String prenom, String nom) {
		super();
		this.email = email;
		this.password = password;
		this.prenom = prenom;
		this.nom = nom;
		this.privilige="client";
		this.avatar="vide";
	}
	
	public Client(String prenom, String nom, String email, String password,
			String type, String nomSociete, String registre,
			String identifiant, String adrssse, String code, String secteur,
			String typeSociete) {
		super();
		this.prenom = prenom;
		this.nom = nom;
		this.email = email;
		this.password = password;
		this.type = type;
		this.nomSociete = nomSociete;
		this.registre = registre;
		this.identifiant = identifiant;
		this.adrssse = adrssse;
		this.code = code;
		this.secteur = secteur;
		this.typeSociete = typeSociete;
		this.privilige="client";
		this.avatar="vide";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
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
	public String getPrivilige() {
		return privilige;
	}
	public void setPrivilige(String privilige) {
		this.privilige = privilige;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNomSociete() {
		return nomSociete;
	}
	public void setNomSociete(String nomSociete) {
		this.nomSociete = nomSociete;
	}
	public String getRegistre() {
		return registre;
	}
	public void setRegistre(String registre) {
		this.registre = registre;
	}
	public String getIdentifiant() {
		return identifiant;
	}
	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}
	public String getAdrssse() {
		return adrssse;
	}
	public void setAdrssse(String adrssse) {
		this.adrssse = adrssse;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSecteur() {
		return secteur;
	}
	public void setSecteur(String secteur) {
		this.secteur = secteur;
	}
	public String getTypeSociete() {
		return typeSociete;
	}
	public void setTypeSociete(String typeSociete) {
		this.typeSociete = typeSociete;
	}


}
