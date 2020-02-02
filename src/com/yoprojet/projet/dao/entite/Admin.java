package com.yoprojet.projet.dao.entite;

public class Admin{
private Long id;
private String email;
private String password;
private String prenom;
private String nom;
private String privilige;
private String avatar;
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
public String getPrivilege() {
	return privilige;
}
public void setPrivilege(String privilige) {
	this.privilige = privilige;
}

public Admin() {
	super();
	// TODO Auto-generated constructor stub
}
public Admin(String email, String password, String prenom, String nom, String privilige) {
	super();
	this.email = email;
	this.password = password;
	this.prenom = prenom;
	this.nom = nom;
	this.privilige = privilige;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
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



}
