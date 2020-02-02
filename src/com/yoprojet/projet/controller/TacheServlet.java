package com.yoprojet.projet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yoprojet.projet.dao.entite.BesoinProjet;
import com.yoprojet.projet.dao.entite.Tache;
import com.yoprojet.projet.services.BesoinProjetServicesImpl;
import com.yoprojet.projet.services.TacheServiceImpl;
@WebServlet("/TacheServlet")
public class TacheServlet extends HttpServlet {
	TacheServiceImpl tacheser;
	BesoinProjetServicesImpl besoinservice;
	private static final long serialVersionUID = 1L;
     public TacheServlet() {
        super();
        tacheser=new TacheServiceImpl();
        besoinservice=new BesoinProjetServicesImpl();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String status=request.getParameter("status");
		String type=request.getParameter("type");
		if(status.equalsIgnoreCase("nouveau") && type.equalsIgnoreCase("chef"))
		{
			HttpSession session = request.getSession();
			List<Tache> listeTache=tacheser.statusUnique(status);
			List<BesoinProjet> listeProjet=besoinservice.listBesoinProjet();
			session.setAttribute("listeProjetChef", listeProjet);
			session.setAttribute("listetache", listeTache);
			response.sendRedirect(request.getContextPath() + "/taches/tacheChef.jsp");
		}
		else if(status.equalsIgnoreCase("en cours")&& type.equalsIgnoreCase("chef"))
		{
			HttpSession session = request.getSession();
			List<Tache> listeTache=tacheser.statusUnique(status);
			List<BesoinProjet> listeProjet=besoinservice.listBesoinProjet();
			session.setAttribute("listeProjetChef", listeProjet);
			session.setAttribute("listetache", listeTache);
			response.sendRedirect(request.getContextPath() + "/taches/tacheChef.jsp");
		}
		else if(status.equalsIgnoreCase("termine")&& type.equalsIgnoreCase("chef"))
		{
			HttpSession session = request.getSession();
			List<Tache> listeTache=tacheser.statusUnique(status);
			List<BesoinProjet> listeProjet=besoinservice.listBesoinProjet();
			session.setAttribute("listeProjetChef", listeProjet);
			session.setAttribute("listetache", listeTache);
			response.sendRedirect(request.getContextPath() + "/taches/tacheChef.jsp");
		}
		/**------------------------------------**/
		else if(status.equalsIgnoreCase("nouveau") && type.equalsIgnoreCase("collaborateur"))
		{
			HttpSession session = request.getSession();
			List<Tache> listeTache=tacheser.statusUnique(status);
			List<BesoinProjet> listeProjet=besoinservice.listBesoinProjet();
			session.setAttribute("listeProjetChef", listeProjet);
			session.setAttribute("listetache", listeTache);
			response.sendRedirect(request.getContextPath() + "/taches/tacheCollaborateur.jsp");
		}
		else if(status.equalsIgnoreCase("en cours")&& type.equalsIgnoreCase("collaborateur"))
		{
			HttpSession session = request.getSession();
			List<Tache> listeTache=tacheser.statusUnique(status);
			List<BesoinProjet> listeProjet=besoinservice.listBesoinProjet();
			session.setAttribute("listeProjetChef", listeProjet);
			session.setAttribute("listetache", listeTache);
			response.sendRedirect(request.getContextPath() + "/taches/tacheCollaborateur.jsp");
		}
		else if(status.equalsIgnoreCase("termine")&& type.equalsIgnoreCase("collaborateur"))
		{
			HttpSession session = request.getSession();
			List<Tache> listeTache=tacheser.statusUnique(status);
			List<BesoinProjet> listeProjet=besoinservice.listBesoinProjet();
			session.setAttribute("listeProjetChef", listeProjet);
			session.setAttribute("listetache", listeTache);
			response.sendRedirect(request.getContextPath() + "/taches/tacheCollaborateur.jsp");
		}
		/**-------------------------------------**/
		else if(status.equalsIgnoreCase("all") && type.equalsIgnoreCase("admin"))
		{
			HttpSession session = request.getSession();
			List<Tache> listeTache=tacheser.listTache();
			List<BesoinProjet> listeProjet=besoinservice.listBesoinProjet();
			session.setAttribute("listeProjetChef", listeProjet);
			session.setAttribute("listetache", listeTache);
			response.sendRedirect(request.getContextPath() + "/taches/tacheAdmin.jsp");
		}
		else if(status.equalsIgnoreCase("update"))
		{
			long id=Long.parseLong(request.getParameter("id"));
			int choix=Integer.parseInt(request.getParameter("choix"));
			HttpSession session = request.getSession();
			List<Tache> listeTache=tacheser.listTache();
			List<BesoinProjet> listeProjet=besoinservice.listBesoinProjet();
			session.setAttribute("listeProjetChef", listeProjet);
			session.setAttribute("listetache", listeTache);
			tacheser.modifierTacheId(id, choix);
			response.sendRedirect(request.getContextPath() + "/CollaborateurAccueil.jsp");
			
		}
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		if(request.getParameter("ajouter")!=null)
			{
			String libelle=request.getParameter("libelle");;
			String datD=request.getParameter("dateD");
			String dateF=request.getParameter("dateF");
			String description=request.getParameter("description");
			String status="nouveau";
			Long idChef=Long.parseLong(request.getParameter("idChef"));
			Long idCollaborateur=Long.parseLong(request.getParameter("idCollaborateur"));
			Long idProjet=Long.parseLong(request.getParameter("idProjet"));
			Tache t=new Tache(libelle,datD,dateF,status,idChef,idCollaborateur,idProjet,description);
			tacheser.ajouterTache(t);
			response.sendRedirect(request.getContextPath() +"/ChefAccueil.jsp");
			}
	}

}
