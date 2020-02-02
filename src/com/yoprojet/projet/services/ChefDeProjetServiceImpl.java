package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.ChefDeProjetDAO;
import com.yoprojet.projet.dao.ChefDeProjetimplDataBase;
import com.yoprojet.projet.dao.entite.ChefDeProjet;

public class ChefDeProjetServiceImpl implements ChefDeProjetService {
ChefDeProjetDAO dao = new ChefDeProjetimplDataBase();
	@Override
	public void ajouterChefDeProjet(ChefDeProjet p) {
		dao.ajouterChefDeProjet(p);
		
	}

	@Override
	public ChefDeProjet rechercherChefDeProjetId(Long id) {
		// TODO Auto-generated method stub
		return dao.rechercherChefDeProjetId(id);
	}

	@Override
	public void supprimerChefDeProjetId(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<ChefDeProjet> listChefDeProjet() {
		// TODO Auto-generated method stub
		return dao.listChefDeProjet();
	}

	@Override
	public void modifierChefDeProjetId(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ChefDeProjet Connexion(String email, String password) {
		// TODO Auto-generated method stub
		return dao.Connexion(email, password);
	}

	@Override
	public ChefDeProjet unique(String email) {
		// TODO Auto-generated method stub
		return dao.unique(email);
	}

	@Override
	public void updateAvatar(ChefDeProjet c) {
		dao.updateAvatar(c);
		
	}

}
