package com.yoprojet.projet.dao.entite;

public class ChefDeProjet{
	private Long id;
	private String email;
	private String prenom;
	private String nom;
	private String ville;
	private String pays;
	private String dateN;
	private String titre;
	private String telephone;
	private String interet;
	private String password;
	private String facebook;
	private String twitter;
	private String googleplus;
	private String privilige;
	private String avatar;
	public ChefDeProjet() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChefDeProjet(String email, String prenom, String nom, String ville, String pays,String dateN, String titre,
			String telephone, String interet, String password, String facebook, String twitter, String googleplus,
			String privilige, String avatar) {
		super();
		this.email = email;
		this.prenom = prenom;
		this.nom = nom;
		this.ville = ville;
		this.pays=pays;
		this.dateN = dateN;
		this.titre = titre;
		this.telephone = telephone;
		this.interet = interet;
		this.password = password;
		this.facebook = facebook;
		this.twitter = twitter;
		this.googleplus = googleplus;
		this.privilige = privilige;
		this.avatar = avatar;
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
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	public String getDateN() {
		return dateN;
	}
	public void setDateN(String dateN) {
		this.dateN = dateN;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getInteret() {
		return interet;
	}
	public void setInteret(String interet) {
		this.interet = interet;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	public String getGoogleplus() {
		return googleplus;
	}
	public void setGoogleplus(String googleplus) {
		this.googleplus = googleplus;
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
