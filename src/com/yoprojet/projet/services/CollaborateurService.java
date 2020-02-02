package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Collaborateur;

public interface CollaborateurService {
	public void ajouterCollaborateur(Collaborateur p);
	public Collaborateur Connexion(String email,String password);
	public Collaborateur unique(String email);
	public void updateAvatar(Collaborateur c);
	public Collaborateur rechercherCollaborateurId(Long id);
	public void supprimerCollaborateurId(int id);
	public ArrayList<Collaborateur> listCollaborateur();
	public void modifierCollaborateurId(int id);
}
