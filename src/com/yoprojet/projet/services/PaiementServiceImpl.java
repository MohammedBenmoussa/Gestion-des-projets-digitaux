package com.yoprojet.projet.services;

import com.yoprojet.projet.dao.PaiementDAO;
import com.yoprojet.projet.dao.PaiementImplDataBase;
import com.yoprojet.projet.dao.entite.Paiement;

public class PaiementServiceImpl implements PaiementService {
private PaiementDAO dao=new PaiementImplDataBase();
	@Override
	public void ajouterPaiement(Paiement p) {
		dao.ajouterPaiement(p);
	}
}
