package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import repository.PaqueteRepository;
import repository.ReservaRepository;
import model.*;

public class SuccessAddReservasServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			
//			request.setAttribute("vuelo", session.getAttribute("vuelo"));
//			request.setAttribute("paquete", session.getAttribute("paquete"));
			request.setAttribute("reserva", session.getAttribute("reserva"));
			
			request.getRequestDispatcher("/WEB-INF/Confirmacion.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				LimpiarSession.deleteSession(request);
				request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}	
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				LimpiarSession.deleteSession(request);
				request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}	
		}
	}
}
