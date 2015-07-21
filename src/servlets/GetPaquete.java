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

			detallePaquete.append("<p><b>Paquete seleccionado</b></p><table class='table table-striped'>");
			
			detallePaquete.append("<tr><td>");
			detallePaquete.append("Descripcion </td><td>" + paquete.getNombre());
			detallePaquete.append("</td></tr>");
			
			detallePaquete.append("<tr><td>");
			detallePaquete.append("Precio</td><td>" + paquete.getPrecio());
			detallePaquete.append("</td></tr>");

			detallePaquete.append("<tr><td>");
			detallePaquete.append("Desde</td><td>" + paquete.getDesde().getNombre());
			detallePaquete.append("</td></tr>");
			
			detallePaquete.append("<tr><td>");
			detallePaquete.append("Hacia</td><td>" + paquete.getHacia().getNombre());
			detallePaquete.append("</td></tr>");
			
			detallePaquete.append("</table>");
			
			detallePaquete.append("<button class=\"btn btn-primary\" type=\"button\" id=\"eliminarPaquete\">Eliminar paquete</button>");

			response.setContentType("text/html");
			response.getWriter().write(detallePaquete.toString());

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().invalidate();
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
