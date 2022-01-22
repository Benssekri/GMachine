package controller;
import beans.Machine;
import beans.Salle;

import com.google.gson.*;
import java.io.IOException;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MachineService;
import service.SalleService;


@WebServlet(name = "MachineController",urlPatterns = {"/MachineController"})
public class MachineController extends HttpServlet {

    /**
	 * 
	 */
	private SalleService ss = new SalleService();
	private MachineService ms = new MachineService();

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
        	if (request.getParameter("op").equals("load")) {
        		response.setContentType("application/json");
        		List<Machine> machines = ms.findAll();
        		List<Salle> salles = ss.findAll();
                Gson json = new Gson();
                String bothList="["+json.toJson(machines)+","+json.toJson(salles)+"]";
                response.getWriter().write(json.toJson(machines));
        	}
        	if (request.getParameter("op").equals("afficher")) {
				response.setContentType("application/json");
				int salle = Integer.parseInt(request.getParameter("salle"));
				SalleService ss = new SalleService();
				Salle s = ss.findById(salle);
				List<Machine> machines = ms.findMachineBySalle(s);
				Gson json = new Gson();
				response.getWriter().write(json.toJson(machines));
			}
        	
            if (request.getParameter("op").equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                ms.delete(ms.findById(id));
                response.setContentType("application/json");
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
               response.getWriter().write(json.toJson(machines));
            } 
            if(request.getParameter("op").equals("afficher")) {
            	response.setContentType("application/json");
            //	Date dateAchat1 = new Date(request.getParameter("dateAchat1").replace("-", "/"));
            //	Date dateAchat2 = new Date(request.getParameter("dateAchat2").replace("-", "/"));
            //	List<Machine> machines=ms.findMachineBetweenTwoDates((java.util.Date)dateAchat1,(java.util.Date) dateAchat2);
            	Gson json = new Gson();
             //   response.getWriter().write(json.toJson(machines));
            }
        } else if (request.getParameter("id") != null) {
            if (!request.getParameter("id").equals("")) {
                String reference = request.getParameter("reference");
                String marque = request.getParameter("marque");
                double prix = Double.parseDouble(request.getParameter("prix"));
                Date dateAchat = new Date(request.getParameter("dateAchat").replace("-", "/"));
                int id = Integer.parseInt(request.getParameter("id"));
                Machine m = ms.findById(id);
                m.setReference(reference);
                m.setPrix(prix);
                m.setMarque(marque);
                m.setDateAchat(dateAchat);
                m.setSalle(ss.findById(Integer.parseInt(request.getParameter("salle"))));
                ms.update(m);
                response.setContentType("application/json");
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
               response.getWriter().write(json.toJson(machines));
            }
        } 
        else {
        	boolean test=false;
        	String reference = request.getParameter("reference");
        	String marque= request.getParameter("marque");
        	double prix = Double.parseDouble(request.getParameter("prix"));
            Date dateAchat = new Date(request.getParameter("dateAchat").replace("-", "/"));
            Salle s=  ss.findById(Integer.parseInt(request.getParameter("salle")));
            if( !ms.findMachineByReference(reference).isEmpty()) {
            	test=true;
            }
            ms.create(new Machine(reference, dateAchat, prix, marque,s));
            response.setContentType("application/json");
            List<Machine> machines = ms.findAll();
            Gson json = new Gson();
            String both="["+json.toJson(test)+","+json.toJson(machines)+"]";
            response.getWriter().write(json.toJson(machines));
        } 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}