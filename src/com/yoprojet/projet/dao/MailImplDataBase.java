package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.classic.Session;

import com.yoprojet.projet.dao.entite.Mail;
import com.yoprojet.projet.util.HibernateUtil;

public class MailImplDataBase implements MailDAO {

	@Override
	public void ajouterMail(Mail p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();	

	}

	@Override
	public Mail rechercherMailId(int id) {
		
		return null;
	}

	@Override
	public void supprimerMailId(int id) {


	}
	@Override
	public ArrayList<Mail> listMail() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Mail> list = (ArrayList<Mail>) session.createQuery("from Mail").list();
		return list;
	}

	@Override
	public void modifierMailId(int id) {
		// TODO Auto-generated method stub

	}

}
