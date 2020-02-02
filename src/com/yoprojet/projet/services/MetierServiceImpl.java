package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.MetierDAO;
import com.yoprojet.projet.dao.MetierImplDataBase;
import com.yoprojet.projet.dao.entite.Metier;

public class MetierServiceImpl implements MetierService{
private MetierDAO dao = new MetierImplDataBase();
	@Override
	public void ajouterMetier(Metier p) {
dao.ajouterMetier(p);
		
	}

	@Override
	public Metier rechercherMetierId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void supprimerMetierrId(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Metier> listMetier() {
	
		return dao.listMetier();
	}

	@Override
	public void modifierMetierId(int id) {
		// TODO Auto-generated method stub
		
	}

}
