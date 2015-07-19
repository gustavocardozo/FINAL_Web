package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FelicidadesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FelicidadesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			if (request.getSession().getAttribute("usuario") != null) {
				request.setAttribute("usuario", request.getSession().getAttribute("usuario"));
				request.getRequestDispatcher("/Felicidades.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/LogIn").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LimpiarSession.deleteSession(request);
			request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
		}
		
	}

}
