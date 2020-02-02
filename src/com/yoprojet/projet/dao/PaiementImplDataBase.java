package com.yoprojet.projet.dao;

import org.hibernate.classic.Session;

import com.yoprojet.projet.dao.entite.Paiement;
import com.yoprojet.projet.util.HibernateUtil;

public class PaiementImplDataBase implements PaiementDAO {

	@Override
	public void ajouterPaiement(Paiement p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();	
	}

}
