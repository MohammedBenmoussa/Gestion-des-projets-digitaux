package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.yoprojet.projet.dao.entite.Admin;
import com.yoprojet.projet.dao.entite.Tache;
import com.yoprojet.projet.util.HibernateUtil;

public class TacheImplDataBase implements TacheDAO {

	@Override
	public void ajouterTache(Tache p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();	
	}

	@Override
	public Tache rechercherTacheId(int id) {
		
		return null;
	}

	@Override
	public void supprimerTacheId(int id) {
		
		
	}

	@Override
	public ArrayList<Tache> listTache() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Tache> list = (ArrayList<Tache>) session.createQuery("from Tache").list();
		return list;
	}

	@Override
	public void modifierTacheId(long id,int type) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		Transaction tx = session.beginTransaction();
		Tache p = (Tache )session.load(Tache.class, id);
		if(type==0) p.setStatus("nouveau");
		else if(type==1) p.setStatus("en cours");
		else if(type==2) p.setStatus("termine");
		session.update(p);
		 tx.commit();
		
	}

	@Override
	public ArrayList<Tache> statusUnique(String status) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Tache> list = (ArrayList<Tache>) session.createQuery("from Tache where status like'"+status+"'").list();
		return list;
	}

}
