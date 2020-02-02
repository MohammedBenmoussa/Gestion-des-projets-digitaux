package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.CollaborateurDAO;
import com.yoprojet.projet.dao.CollaborateurImplDataBase;
import com.yoprojet.projet.dao.entite.Collaborateur;

public class CollaborateurServicesImpl implements CollaborateurService {
CollaborateurDAO dao=new CollaborateurImplDataBase();
	public void ajouterCollaborateur(Collaborateur p) {
		dao.ajouterCollaborateur(p);
	}
	@Override
	public Collaborateur Connexion(String email, String password) {
		// TODO Auto-generated method stub
		return dao.Connexion(email, password);
	}

	@Override
	public Collaborateur rechercherCollaborateurId(Long id) {
		// TODO Auto-generated method stub
		return dao.rechercherCollaborateurId(id);
	}

	@Override
	public void supprimerCollaborateurId(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<Collaborateur> listCollaborateur() {
		// TODO Auto-generated method stub
		return dao.listCollaborateur();
	}

	@Override
	public void modifierCollaborateurId(int id) {
		// TODO Auto-generated method stub

	}
	@Override
	public Collaborateur unique(String email) {
		// TODO Auto-generated method stub
		return dao.unique(email);
	}
	@Override
	public void updateAvatar(Collaborateur c) {
		dao.updateAvatar(c);
		
	}

}
