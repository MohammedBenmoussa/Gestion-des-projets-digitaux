package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.BesoinProjet;

public interface BesoinProjetDAO {
	public void ajouterBesoinProjet(BesoinProjet p);
	public BesoinProjet rechercherBesoinProjetId(Long id);
	public void activeProjet(BesoinProjet b);
	public void supprimerBesoinProjetId(int id);
	public ArrayList<BesoinProjet> listBesoinProjet();
	public void modifierBesoinProjetId(int id);
	public long nbreactice();
}
