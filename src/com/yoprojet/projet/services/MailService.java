package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Mail;

public interface MailService {
	public void ajouterMail(Mail p);
	public Mail rechercherMailId(int id);
	public void supprimerMailId(int id);
	public ArrayList<Mail> listMail();
	public void modifierMailId(int id);
}
