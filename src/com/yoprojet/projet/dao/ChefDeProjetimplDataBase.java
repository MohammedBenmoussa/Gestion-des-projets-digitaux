package com.yoprojet.projet.dao;
import java.util.ArrayList;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.yoprojet.projet.dao.entite.ChefDeProjet;
import com.yoprojet.projet.util.HibernateUtil;

public class ChefDeProjetimplDataBase implements ChefDeProjetDAO{

	public ChefDeProjetimplDataBase() {
		super();
	}

	@Override
	public void ajouterChefDeProjet(ChefDeProjet p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();
		
	}

	@Override
	public ChefDeProjet rechercherChefDeProjetId(Long id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		ChefDeProjet p = (ChefDeProjet) session.load(ChefDeProjet.class, id);
		return p;
	}

	@Override
	public void supprimerChefDeProjetId(int id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		ChefDeProjet p = (ChefDeProjet) session.load(ChefDeProjet.class, id);
		session.delete(p);
		session.getTransaction().commit();
	}

	@Override
	public ArrayList<ChefDeProjet> listChefDeProjet() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<ChefDeProjet> list = (ArrayList<ChefDeProjet>) session.createQuery("from ChefDeProjet").list();
		return list;
	}

	@Override
	public void modifierChefDeProjetId(int id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		Transaction tx = session.beginTransaction();
		ChefDeProjet p = (ChefDeProjet )session.load(ChefDeProjet.class, id);
		session.update(p);
		 tx.commit();
		
	}

	@Override
	public ChefDeProjet Connexion(String email, String password) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		ChefDeProjet c=(ChefDeProjet) session.createCriteria(ChefDeProjet.class)
				.add(Restrictions.eq("email",email))
				.add(Restrictions.eq("password",password)).uniqueResult();
		//System.out.print(c.getDateN());
		return c;
	}

	@Override
	public ChefDeProjet unique(String email) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		ChefDeProjet c=(ChefDeProjet) session.createCriteria(ChefDeProjet.class)
				.add(Restrictions.eq("email",email)).uniqueResult();
		return c;
	}

	@Override
	public void updateAvatar(ChefDeProjet c) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(c);
		session.getTransaction().commit();	
		
	}

}
