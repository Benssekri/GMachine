package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import beans.*;
import service.*;

@WebServlet(urlPatterns = { "/SalleController" })

public class SalleController extends HttpServlet {
	private SalleService ss = new SalleService();

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// response.sendRedirect("GestionSalle.jsp");
		if (request.getParameter("op") != null) {
			if (request.getParameter("op").equals("load")) {
				response.setContentType("application/json");
				List<Salle> salles = ss.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));
			}
			if (request.getParameter("op").equals("update")) {
				int id = Integer.parseInt(request.getParameter("id"));
				String code = request.getParameter("code");
				String type = request.getParameter("type");
				Salle salle = ss.findById(id);
				salle.setCode(code);
				salle.setType(type);
				ss.update(salle);
				response.setContentType("application/json");
				List<Salle> salles = ss.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));
			}

			 if (request.getParameter("op").equals("delete")) {
	        		int id= Integer.parseInt(request.getParameter("id"));
	        		Salle salle = ss.findById(id);
	        		ss.delete(salle);
	        		response.setContentType("application/json");
	                List<Salle> salles = ss.findAll();
	                Gson json = new Gson();
	                response.getWriter().write(json.toJson(salles));
	        	}
		} else {
			String code = request.getParameter("code");
			String type = request.getParameter("type");
			ss.create(new Salle(code, type));
			response.setContentType("application/json");
			List<Salle> salles = ss.findAll();
			Gson json = new Gson();
			response.getWriter().write(json.toJson(salles));
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
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}