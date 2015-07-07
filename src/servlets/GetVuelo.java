package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Vuelo;
import repository.VueloRepository;

/**
 * Servlet implementation class GetVuelo
 */
@WebServlet("/GetVuelo")
public class GetVuelo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetVuelo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Integer idVuelo = Integer.parseInt(request.getParameter("idVuelo"));
			VueloRepository vueloRepository = new VueloRepository();

			Vuelo vuelo = vueloRepository.GetByIdBase(idVuelo);
			StringBuilder detallePaquete = new StringBuilder();

			
			detallePaquete.append("<p>");
			detallePaquete.append("Desde: " + vuelo.getDesde());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");
			detallePaquete.append("Hacia: " + vuelo.getHacia());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");
			detallePaquete.append("Horario de Partida: " + vuelo.getPartida());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");
			detallePaquete.append("Horario de Llegada: " + vuelo.getLlegada());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");
			detallePaquete.append("Precio: " + vuelo.getPrecio());
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");
			detallePaquete.append("<p>");
			detallePaquete.append("Disponibilidad: ");
			detallePaquete.append("</p>");
			detallePaquete.append("<br>");

			response.setContentType("text/html");
			response.getWriter().write(detallePaquete.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
