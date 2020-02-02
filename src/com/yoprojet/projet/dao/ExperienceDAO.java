package com.yoprojet.projet.dao;

import java.util.ArrayList;

import com.yoprojet.projet.dao.entite.Experience;

public interface ExperienceDAO {
	public void ajouterExperience(Experience p);
	public Experience rechercherExperienceId(int id);
	public void supprimerExperienceId(int id);
	public ArrayList<Experience> listExperience();
	public void modifierExperienceId(int id);
}
