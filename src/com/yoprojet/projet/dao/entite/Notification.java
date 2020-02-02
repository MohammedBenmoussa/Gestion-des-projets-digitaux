package com.yoprojet.projet.dao.entite;

public class Notification {
private Long id;
private int idClient;
private String date;
private String description;
private int status;
public Notification() {
	super();
	// TODO Auto-generated constructor stub
}
public Notification(int idClient, String date, String description, int status) {
	super();
	this.idClient = idClient;
	this.date = date;
	this.description = description;
	this.status = status;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public int getIdClient() {
	return idClient;
}
public void setIdClient(int idClient) {
	this.idClient = idClient;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}

}
