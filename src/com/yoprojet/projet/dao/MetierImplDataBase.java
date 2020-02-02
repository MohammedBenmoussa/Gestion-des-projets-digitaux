package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.classic.Session;

import com.yoprojet.projet.dao.entite.Metier;
import com.yoprojet.projet.util.HibernateUtil;

public class MetierImplDataBase implements MetierDAO{

	@Override
	public void ajouterMetier(Metier p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();		
	}

	@Override
	public Metier rechercherMetierId(int id) {
		return null;
	}

	@Override
	public void supprimerMetierrId(int id) {
		
	}

	@Override
	public ArrayList<Metier> listMetier() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Metier> list = (ArrayList<Metier>) session.createQuery("from Metier").list();
		return list;
	}

	@Override
	public void modifierMetierId(int id) {

		
	}

}
