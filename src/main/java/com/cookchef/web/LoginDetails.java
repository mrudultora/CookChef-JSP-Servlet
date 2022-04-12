package com.cookchef.web;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cookchef.dao.LoginSignUpDao;

/**
 * @author Mrudul Tora (0801IT191049)
 * @author Preetam Pratyush Pal (0801IT191059)
 */
@WebServlet("/LoginDetails")
public class LoginDetails extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		Base64.Encoder encoder = Base64.getEncoder();
		String password = encoder.encodeToString(req.getParameter("password").getBytes());
		boolean isExist = new LoginSignUpDao().validateUser(username, password);
		HttpSession httpSession = req.getSession();
		if (isExist) {
			httpSession.setAttribute("username", username);
			resp.sendRedirect("/CookChef/recipe-list.jsp");
		} else {
			httpSession.invalidate();
			req.setAttribute("error", "No such user exists. Try Again!");
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}
	}

}
