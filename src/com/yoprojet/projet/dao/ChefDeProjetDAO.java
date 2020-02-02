package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Admin;
import com.yoprojet.projet.dao.entite.ChefDeProjet;
import com.yoprojet.projet.dao.entite.Collaborateur;

public interface ChefDeProjetDAO {
	public void ajouterChefDeProjet(ChefDeProjet p);
	public ChefDeProjet rechercherChefDeProjetId(Long id);
	public ChefDeProjet Connexion(String email,String password);
	public ChefDeProjet unique(String email);
	public void supprimerChefDeProjetId(int id);
	public void updateAvatar(ChefDeProjet c);
	public ArrayList<ChefDeProjet> listChefDeProjet();
	public void modifierChefDeProjetId(int id);
}
