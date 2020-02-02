package com.yoprojet.projet.services;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Education;

public interface EducationService {
	public void ajouterEducation(Education p);
	public Education rechercherEducationId(int id);
	public void supprimerEducationId(int id);
	public ArrayList<Education> listEducation();
	public void modifierEducationId(int id);
}
