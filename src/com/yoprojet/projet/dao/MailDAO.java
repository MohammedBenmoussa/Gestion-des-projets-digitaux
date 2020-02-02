package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Mail;

public interface MailDAO {
	public void ajouterMail(Mail p);
	public Mail rechercherMailId(int id);
	public void supprimerMailId(int id);
	public ArrayList<Mail> listMail();
	public void modifierMailId(int id);
}
