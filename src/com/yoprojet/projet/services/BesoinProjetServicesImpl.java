package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.BesoinProjet;
import com.yoprojet.projet.dao.BesoinProjetDAO;
import com.yoprojet.projet.dao.BesoinProjetImplDataBase;

public class BesoinProjetServicesImpl implements BesoinProjetServices {
	BesoinProjetDAO dao=new BesoinProjetImplDataBase();
	@Override
	public void ajouterBesoinProjet(BesoinProjet p) {
		dao.ajouterBesoinProjet(p);

	}

	@Override
	public BesoinProjet rechercherBesoinProjetId(Long id) {
		return dao.rechercherBesoinProjetId(id);
	}

	@Override
	public void supprimerBesoinProjetId(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<BesoinProjet> listBesoinProjet() {
		// TODO Auto-generated method stub
		return dao.listBesoinProjet();
	}

	@Override
	public void modifierBesoinProjetId(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void activeProjet(BesoinProjet b) {
		dao.activeProjet(b);
		
	}

	@Override
	public long nbreactice() {
		// TODO Auto-generated method stub
		return dao.nbreactice();
	}



}
