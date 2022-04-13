package com.cookchef.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cookchef.dao.RecipeDao;

@WebServlet("/EditOrUpdate")
public class EditOrUpdate extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		int id = Integer.parseInt(req.getParameter("id"));
		switch (action) {
		case "edit":
			req.setAttribute("id", id);
			RequestDispatcher rd1 = req.getRequestDispatcher("/update-recipe.jsp");
			rd1.forward(req, resp);
			break;
		case "delete":
			new RecipeDao().deleteRecipe(id);
			resp.sendRedirect("/CookChef/recipe-list.jsp");
			break;
		default:
			req.setAttribute("error", "This action cannot be performed. Some error occured.");
			RequestDispatcher rd2= req.getRequestDispatcher("/Error.jsp");
			rd2.forward(req, resp);
			break;
		}
	}

}
