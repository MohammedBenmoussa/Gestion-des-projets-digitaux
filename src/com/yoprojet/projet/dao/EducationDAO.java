package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Education;

public interface EducationDAO {
	public void ajouterEducation(Education p);
	public Education rechercherEducationId(int id);
	public void supprimerEducationId(int id);
	public ArrayList<Education> listEducation();
	public void modifierEducationId(int id);
}
