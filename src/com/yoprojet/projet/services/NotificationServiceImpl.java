package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.NotificationDAO;
import com.yoprojet.projet.dao.NotificationImplDataBase;
import com.yoprojet.projet.dao.entite.Notification;

public class NotificationServiceImpl implements NotificationService {
NotificationDAO dao=new NotificationImplDataBase();
	@Override
	public void ajouterNotification(Notification n) {
		// TODO Auto-generated method stub
dao.ajouterNotification(n);
	}

	@Override
	public Notification rechercherNotificationId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void supprimerNotificationId(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<Notification> listNotification() {
		// TODO Auto-generated method stub
		return dao.listNotification();
	}

	@Override
	public void modifierNotificationId(int id) {
		// TODO Auto-generated method stub

	}

}
