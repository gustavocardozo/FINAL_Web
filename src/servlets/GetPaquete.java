package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Paquete;
import repository.PaqueteRepository;

public class GetPaquete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetPaquete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Integer idPaquete = Integer.parseInt(request.getParameter("idPaquete"));
			PaqueteRepository paqueteRepository = new PaqueteRepository();

			Paquete paquete = paqueteRepository.GetByIdBase(idPaquete);
			StringBuilder detallePaquete = new StringBuilder();

			detallePaquete.append("<p>");
			detallePaquete.append("Descripcion: " + paquete.getNombre());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");
			detallePaquete.append("Precio: " + paquete.getPrecio());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");
			detallePaquete.append("Desde: " + paquete.getDesde());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");
			detallePaquete.append("Hacia: " + paquete.getHacia());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");

			response.setContentType("text/html");
			response.getWriter().write(detallePaquete.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
