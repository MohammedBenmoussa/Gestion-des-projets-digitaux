package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Notification;
public interface NotificationDAO 
{
public void ajouterNotification(Notification n);
public  Notification rechercherNotificationId(int id);
public void supprimerNotificationId(int id);
public ArrayList<Notification> listNotification();
public void modifierNotificationId(int id);
}
