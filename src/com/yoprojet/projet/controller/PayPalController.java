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
import com.yoprojet.projet.dao.entite.Paiement;
import com.yoprojet.projet.paypal.*;
import com.yoprojet.projet.services.PaiementServiceImpl;
@WebServlet("/PayPalController")
public class PayPalController extends HttpServlet {
	PaiementServiceImpl paiementService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayPalController() {
        super();
        // TODO Auto-generated constructor stub
        paiementService=new PaiementServiceImpl();   
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		long id=(Long)session.getAttribute("id");
		long idProjet=(Long)session.getAttribute("idProjet");
		String tx=request.getParameter("tx");
		List<BesoinProjet> list=(List<BesoinProjet>) session.getAttribute("listeProjet");
		long idChef=0;
		long montant=0;
		String date=(String)session.getAttribute("date");
		for(BesoinProjet projet:list)
		{
			if(projet.getId()==idProjet)
			{
				idChef=projet.getIdChef();
				montant=(long) projet.getBudget();
				break;
			}
		}
		
		
		System.out.println(tx+" - "+id+" - "+idProjet+" - "+idChef+" - "+montant+" - "+date);
		
		paiementService.ajouterPaiement(new Paiement(id,idProjet,idChef,montant,date,tx));
		response.sendRedirect(request.getContextPath() + "/projetserv?type=projetclientsituation");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
