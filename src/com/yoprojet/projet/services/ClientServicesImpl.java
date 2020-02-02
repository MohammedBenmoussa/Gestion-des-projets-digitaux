package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.ClientDAO;
import com.yoprojet.projet.dao.ClientImplDataBase;
import com.yoprojet.projet.dao.entite.Client;

public class ClientServicesImpl implements ClientServices {
ClientDAO dao=new ClientImplDataBase();
	@Override
	public void ajouterClient(Client p) {
		dao.ajouterClient(p);
	}
	@Override
	public Client rechercherClientId(Long id) {
		
		return dao.rechercherClientId(id);
	}

	@Override
	public void supprimerClientId(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<Client> listClient() {
		// TODO Auto-generated method stub
		return dao.listClient();
	}

	@Override
	public void modifierClientId(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public Client Connexion(String email,String password) {
		
		return dao.Connexion(email, password);
	}

	@Override
	public Client unique(String email) {
		// TODO Auto-generated method stub
		return dao.unique(email);
	}

	@Override
	public void updateAvatar(Client a) {
		dao.updateAvatar(a);
		
	}

}
