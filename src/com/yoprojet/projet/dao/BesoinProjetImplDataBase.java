package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.classic.Session;

import com.yoprojet.projet.dao.entite.BesoinProjet;
import com.yoprojet.projet.util.HibernateUtil;

public class BesoinProjetImplDataBase implements BesoinProjetDAO {

	@Override
	public void ajouterBesoinProjet(BesoinProjet p) 
	{
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();	
	}

	@Override
	public BesoinProjet rechercherBesoinProjetId(Long id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		BesoinProjet b=(BesoinProjet) session.get(BesoinProjet.class, id);
		session.close();
		return b;
	}

	@Override
	public void supprimerBesoinProjetId(int id) {
		

	}

	@Override
	public ArrayList<BesoinProjet> listBesoinProjet() 
	{
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<BesoinProjet> list = (ArrayList<BesoinProjet>) session.createQuery("from BesoinProjet").list();
		return list;
	}

	@Override
	public void modifierBesoinProjetId(int id) 
	{
		

	}

	@Override
	public void activeProjet(BesoinProjet b) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(b);
		session.getTransaction().commit();
		
	}

	@Override
	public long nbreactice() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println(session.createQuery("select count(*) from BesoinProjet where active=0").uniqueResult());
		return (Long) session.createQuery("select count(*) from BesoinProjet where active=0").uniqueResult();
	}

}
