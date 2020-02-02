package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.EducationDAO;
import com.yoprojet.projet.dao.EducationImplDataBase;
import com.yoprojet.projet.dao.entite.Education;

public class EducationServiceImpl implements EducationService {
EducationDAO dao=new EducationImplDataBase();
	@Override
	public void ajouterEducation(Education p) {

		dao.ajouterEducation(p);
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

		return dao.listEducation();
	}

	@Override
	public void modifierEducationId(int id) {

		
	}

}
