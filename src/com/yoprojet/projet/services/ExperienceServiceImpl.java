package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.ExperienceDAO;
import com.yoprojet.projet.dao.ExperienceImplDataBae;
import com.yoprojet.projet.dao.entite.Experience;

public class ExperienceServiceImpl implements ExperienceService {
 ExperienceDAO dao=new ExperienceImplDataBae();
	@Override
	public void ajouterExperience(Experience p) {
		dao.ajouterExperience(p);
		
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
		return dao.listExperience();
	}

	@Override
	public void modifierExperienceId(int id) {
		// TODO Auto-generated method stub
		
	}

}
