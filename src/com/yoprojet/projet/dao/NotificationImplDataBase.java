package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.classic.Session;

import com.yoprojet.projet.dao.entite.Notification;
import com.yoprojet.projet.util.HibernateUtil;

public class NotificationImplDataBase implements NotificationDAO {

	@Override
	public void ajouterNotification(Notification n) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(n);
		session.getTransaction().commit();
	}
	@Override
	public Notification rechercherNotificationId(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void supprimerNotificationId(int id) {

	}
	@Override
	public ArrayList<Notification> listNotification() {
		// TODO Auto-generated method stub
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Notification> list = (ArrayList<Notification>) session.createQuery("from Notification").list();
		return list;
	}
	@Override
	public void modifierNotificationId(int id) {
		// TODO Auto-generated method stub

	}

}
