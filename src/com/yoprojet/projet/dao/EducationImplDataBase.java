package com.yoprojet.projet.dao;


import java.util.ArrayList;

import org.hibernate.classic.Session;

import com.yoprojet.projet.dao.EducationDAO;
import com.yoprojet.projet.dao.entite.Education;
import com.yoprojet.projet.util.HibernateUtil;

public class EducationImplDataBase implements EducationDAO {

	@Override
	public void ajouterEducation(Education p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();	
	}

	@Override
	public Education rechercherEducationId(int id) {
	
		return null;
	}

	@Override
	public void supprimerEducationId(int id) {
	
	}

	@Override
	public ArrayList<Education> listEducation() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Education> list = (ArrayList<Education>) session.createQuery("from Education").list();
		return list;
	}

	@Override
	public void modifierEducationId(int id) {

		
	}

}
