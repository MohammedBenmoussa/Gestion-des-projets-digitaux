package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.ChefDeProjet;
import com.yoprojet.projet.dao.entite.Client;
import com.yoprojet.projet.dao.entite.Collaborateur;

public interface CollaborateurDAO {
	public void ajouterCollaborateur(Collaborateur p);
	public Collaborateur Connexion(String email,String password);
	public Collaborateur unique(String email);
	public Collaborateur rechercherCollaborateurId(Long id);
	public void updateAvatar(Collaborateur c);
	public void supprimerCollaborateurId(int id);
	public ArrayList<Collaborateur> listCollaborateur();
	public void modifierCollaborateurId(int id);
}
