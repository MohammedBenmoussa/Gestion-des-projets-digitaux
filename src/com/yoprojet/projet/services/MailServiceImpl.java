package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.MailDAO;
import com.yoprojet.projet.dao.MailImplDataBase;
import com.yoprojet.projet.dao.entite.Mail;

public class MailServiceImpl implements MailService {
MailDAO dao=new MailImplDataBase();
	@Override
	public void ajouterMail(Mail p) {
		dao.ajouterMail(p);

	}

	@Override
	public Mail rechercherMailId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void supprimerMailId(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<Mail> listMail() {
		// TODO Auto-generated method stub
		return dao.listMail();
	}

	@Override
	public void modifierMailId(int id) {
		// TODO Auto-generated method stub

	}

}
