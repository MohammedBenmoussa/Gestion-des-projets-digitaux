package com.yoprojet.projet.dao;

import java.util.ArrayList;

import org.hibernate.classic.Session;

import com.yoprojet.projet.dao.entite.Experience;
import com.yoprojet.projet.util.HibernateUtil;

public class ExperienceImplDataBae implements ExperienceDAO {

	@Override
	public void ajouterExperience(Experience p) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();	
		
	}

	@Override
	public Experience rechercherExperienceId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void supprimerExperienceId(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Experience> listExperience() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		ArrayList<Experience> list = (ArrayList<Experience>) session.createQuery("from Experience").list();
		return list;
	}

	@Override
	public void modifierExperienceId(int id) {
		// TODO Auto-generated method stub
		
	}

}
