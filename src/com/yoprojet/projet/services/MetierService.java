package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Metier;

public interface MetierService {
	public void ajouterMetier(Metier p);
	public Metier rechercherMetierId(int id);
	public void supprimerMetierrId(int id);
	public ArrayList<Metier> listMetier();
	public void modifierMetierId(int id);
}
