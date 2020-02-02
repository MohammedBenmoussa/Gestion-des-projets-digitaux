package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Tache;

public interface TacheDAO {
	public void ajouterTache(Tache p);
	public Tache rechercherTacheId(int id);
	public void supprimerTacheId(int id);
	public ArrayList<Tache> listTache();
	public void modifierTacheId(long id,int type);
	public ArrayList<Tache> statusUnique(String status);
}
