package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.AdminDAO;
import com.yoprojet.projet.dao.AdminImplDataBase;
import com.yoprojet.projet.dao.entite.Admin;

public class AdminServiceImpl implements AdminService{
AdminDAO dao = new AdminImplDataBase();
	@Override
	public void ajouterAdministrateur(Admin p) {
		
		
	}

	@Override
	public Admin rechercherAdministrateurId(Long id) {
		// TODO Auto-generated method stub
		return dao.rechercherAdministrateurId(id);
	}

	@Override
	public void supprimerAdministrateurId(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Admin> listAdministrateur() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifierAdministrateurId(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Admin Connexion(String email, String password) {
		// TODO Auto-generated method stub
		return dao.Connexion(email, password);
	}

	@Override
	public Admin unique(String email) {
		// TODO Auto-generated method stub
		return dao.unique(email);
	}

	@Override
	public void updateAvatar(Admin a) {
		dao.updateAvatar(a);
		
	}

}
