package com.yoprojet.projet.dao.entite;



public class Audit {

private Long id;
private String dateV;
private String dateF;
private Long status;
public Audit() {
	super();
	// TODO Auto-generated constructor stub
}
public Audit(String dateV, String dateF, Long status) {
	super();
	this.dateV = dateV;
	this.dateF = dateF;
	this.status = status;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getDateV() {
	return dateV;
}
public void setDateV(String dateV) {
	this.dateV = dateV;
}
public String getDateF() {
	return dateF;
}
public void setDateF(String dateF) {
	this.dateF = dateF;
}
public Long getStatus() {
	return status;
}
public void setStatus(Long status) {
	this.status = status;
}



}
