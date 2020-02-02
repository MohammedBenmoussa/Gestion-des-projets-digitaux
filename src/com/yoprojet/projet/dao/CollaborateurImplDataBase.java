package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.yoprojet.projet.dao.entite.Admin;
import com.yoprojet.projet.dao.entite.Collaborateur;
import com.yoprojet.projet.util.HibernateUtil;

public class CollaborateurImplDataBase implements CollaborateurDAO {

	@Override
	public void ajouterCollaborateur(Collaborateur p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();	
	}

	@Override
	public Collaborateur Connexion(String email, String password) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Collaborateur c=(Collaborateur) session.createCriteria(Collaborateur.class)
				.add(Restrictions.eq("email",email))
				.add(Restrictions.eq("password",password)).uniqueResult();
		//System.out.print(c.getDateN());
		return c;
	}

	@Override
	public Collaborateur rechercherCollaborateurId(Long id) {
		
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Collaborateur p = (Collaborateur )session.load(Collaborateur.class, id);
		return p;
	}

	@Override
	public void supprimerCollaborateurId(int id) {
		

	}

	@Override
	public ArrayList<Collaborateur> listCollaborateur() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Collaborateur> list = (ArrayList<Collaborateur>) session.createQuery("from Collaborateur").list();
		return list;
	}

	@Override
	public void modifierCollaborateurId(int id) {
		

	}

	@Override
	public Collaborateur unique(String email) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Collaborateur c=(Collaborateur) session.createCriteria(Collaborateur.class)
				.add(Restrictions.eq("email",email)).uniqueResult();
		return c;
	}

	@Override
	public void updateAvatar(Collaborateur c) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(c);
		session.getTransaction().commit();	
		
	}

}
