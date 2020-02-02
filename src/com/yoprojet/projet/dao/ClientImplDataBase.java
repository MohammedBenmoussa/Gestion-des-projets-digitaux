package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.yoprojet.projet.dao.entite.Client;
import com.yoprojet.projet.util.HibernateUtil;

public class ClientImplDataBase implements ClientDAO{

	@Override
	public void ajouterClient(Client p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();		
	}

	@Override
	public Client rechercherClientId(Long id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Client p = (Client) session.load(Client.class, id);
		return p;
	}

	@Override
	public void supprimerClientId(int id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Client p = (Client) session.load(Client.class, id);
		session.delete(p);
		session.getTransaction().commit();
		
		
	}

	@Override
	public ArrayList<Client> listClient() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Client> list = (ArrayList<Client>) session.createQuery("from Client").list();
		return list;
	}

	@Override
	public void modifierClientId(int id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		Transaction tx = session.beginTransaction();
		Client p = (Client )session.load(Client.class, id);
		session.update(p);
		tx.commit();
		
	}

	@Override
	public Client Connexion(String email,String password) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Client c=(Client) session.createCriteria(Client.class)
				.add(Restrictions.eq("email",email))
				.add(Restrictions.eq("password",password)).uniqueResult();
		//System.out.print(c.getDateN());
		return c;
	}

	@Override
	public Client unique(String email) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Client c=(Client) session.createCriteria(Client.class)
				.add(Restrictions.eq("email",email)).uniqueResult();
		return c;
	}

	@Override
	public void updateAvatar(Client a) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(a);
		session.getTransaction().commit();	
		
	}

}
