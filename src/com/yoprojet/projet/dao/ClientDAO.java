package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Admin;
import com.yoprojet.projet.dao.entite.ChefDeProjet;
import com.yoprojet.projet.dao.entite.Client;

public interface ClientDAO 
{
	public void ajouterClient(Client p);
	public Client Connexion(String email,String password);
	public Client unique(String email);
	public Client rechercherClientId(Long id);
	public void updateAvatar(Client a);
	public void supprimerClientId(int id);
	public ArrayList<Client> listClient();
	public void modifierClientId(int id);
}
