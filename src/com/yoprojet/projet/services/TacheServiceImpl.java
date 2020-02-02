package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.TacheDAO;
import com.yoprojet.projet.dao.TacheImplDataBase;
import com.yoprojet.projet.dao.entite.Tache;

public class TacheServiceImpl implements TacheService {
TacheDAO dao=new TacheImplDataBase();
	@Override
	public void ajouterTache(Tache p) {
		dao.ajouterTache(p);

	}

	@Override
	public Tache rechercherTacheId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void supprimerTacheId(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<Tache> listTache() {
		// TODO Auto-generated method stub
		return dao.listTache();
	}

	@Override
	public void modifierTacheId(long id,int type) {
		// TODO Auto-generated method stub
		dao.modifierTacheId(id, type);
	}

	@Override
	public ArrayList<Tache> statusUnique(String status) {
		return dao.statusUnique(status);
	}

}
