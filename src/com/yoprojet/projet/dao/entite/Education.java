package com.yoprojet.projet.dao.entite;

public class Education {
	private Long id;
	private String intitule;
	private String organisation;
	private String dated;
	private String datef;
	private Long idCollaborateur;
	private String privilige;
	public Education(String intitule, String organisation, String dated,
			String datef, Long idCollaborateur,String privilige) {
		super();
		this.intitule = intitule;
		this.organisation = organisation;
		this.dated = dated;
		this.datef = datef;
		this.idCollaborateur = idCollaborateur;
		this.privilige=privilige;
	}
	public Education() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getIntitule() {
		return intitule;
	}
	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}
	public String getOrganisation() {
		return organisation;
	}
	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}
	
	
	public Long getIdCollaborateur() {
		return idCollaborateur;
	}
	public void setIdCollaborateur(Long idCollaborateur) {
		this.idCollaborateur = idCollaborateur;
	}
	public String getPrivilige() {
		return privilige;
	}
	public void setPrivilige(String privilige) {
		this.privilige = privilige;
	}
	public void setDated(String dated) {
		this.dated = dated;
	}
	public void setDatef(String datef) {
		this.datef = datef;
	}
	public String getDated() {
		return dated;
	}
	public String getDatef() {
		return datef;
	}
}
