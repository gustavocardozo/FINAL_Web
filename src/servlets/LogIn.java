package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public HashMap<String, String> Usuarios;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogIn() {
		super();
		Usuarios = new HashMap<String, String>();
		Usuarios.put("Admin", "admin");
		Usuarios.put("Gonzalo", "gonzalo");
		Usuarios.put("Gustavo", "gustavo");
		Usuarios.put("Maxi", "maxi");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if(Boolean.parseBoolean(request.getParameter("logOut")))
			{
				LimpiarSession.deleteSession(request);
				request.getSession().setAttribute("usuario", null);
			}
				request.getRequestDispatcher("/WEB-INF/LogIn.jsp").forward(request, response);			

		} catch (Exception e) {
			LimpiarSession.deleteSession(request);
			request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String user = (request.getParameter("user") == null) ? "" : request.getParameter("user");
			String pass = (request.getParameter("pass") == null) ? "" : request.getParameter("pass");
			String getPass= Usuarios.get(user);
			
			if(getPass==null || !getPass.equals(pass))
			{
				request.setAttribute("errores", "Usuario/Contraseña incorrecta");
				request.getRequestDispatcher("/WEB-INF/LogIn.jsp").forward(request, response);
			}
			else
			{
				request.getSession().setAttribute("usuario", user);
				request.getRequestDispatcher("/Index").forward(request, response);
			}

		} catch (Exception e) {
			LimpiarSession.deleteSession(request);
			request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
		}
	}

}
