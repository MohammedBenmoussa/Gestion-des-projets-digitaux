package com.yoprojet.projet.services;

import java.util.ArrayList;



import com.yoprojet.projet.dao.entite.Admin;
import com.yoprojet.projet.dao.entite.ChefDeProjet;

public interface ChefDeProjetService {
	public void ajouterChefDeProjet(ChefDeProjet p);
	public ChefDeProjet rechercherChefDeProjetId(Long id);
	public ChefDeProjet Connexion(String email,String password);
	public ChefDeProjet unique(String email);
	public void updateAvatar(ChefDeProjet c);
	public void supprimerChefDeProjetId(int id);
	public ArrayList<ChefDeProjet> listChefDeProjet();
	public void modifierChefDeProjetId(int id);
}
