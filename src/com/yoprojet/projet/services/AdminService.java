package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Admin;

public interface AdminService {
	public void ajouterAdministrateur(Admin p);
	public Admin rechercherAdministrateurId(Long id);
	public Admin Connexion(String email,String password);
	public Admin unique(String email);
	public void updateAvatar(Admin a);
	public void supprimerAdministrateurId(int id);
	public ArrayList<Admin> listAdministrateur();
	public void modifierAdministrateurId(int id);
}
