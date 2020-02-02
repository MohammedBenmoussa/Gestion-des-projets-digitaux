package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.yoprojet.projet.dao.entite.Admin;
import com.yoprojet.projet.util.HibernateUtil;

public class AdminImplDataBase implements AdminDAO{

	public AdminImplDataBase() {
		super();
	}

	@Override
	public void ajouterAdministrateur(Admin p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();
		
	}

	@Override
	public Admin rechercherAdministrateurId(Long id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Admin p = (Admin )session.load(Admin.class, id);
		return p;
	}

	@Override
	public void supprimerAdministrateurId(int id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Admin p = (Admin) session.load(Admin.class, id);
		session.delete(p);
		session.getTransaction().commit();
		
	}

	@Override
	public ArrayList<Admin> listAdministrateur() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Admin> list = (ArrayList<Admin>) session.createQuery("from Admin").list();
		return list;
	}

	@Override
	public void modifierAdministrateurId(int id) {
		
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		Transaction tx = session.beginTransaction();
		Admin p = (Admin )session.load(Admin.class, id);
		session.update(p);
		 tx.commit();
	       
		
	}

	@Override
	public Admin Connexion(String email, String password) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Admin c=(Admin) session.createCriteria(Admin.class)
				.add(Restrictions.eq("email",email))
				.add(Restrictions.eq("password",password)).uniqueResult();
		//System.out.print(c.getDateN());
		return c;
	}

	@Override
	public Admin unique(String email) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Admin c=(Admin) session.createCriteria(Admin.class)
				.add(Restrictions.eq("email",email)).uniqueResult();
		return c;
	}

	@Override
	public void updateAvatar(Admin a) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(a);
		session.getTransaction().commit();	
	}

}
