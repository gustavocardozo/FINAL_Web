package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Locale;

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
			SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy HH:mm", Locale.getDefault());
			Integer idVuelo = Integer.parseInt(request.getParameter("idVuelo"));
			VueloRepository vueloRepository = new VueloRepository();

			Vuelo vuelo = vueloRepository.GetByIdBase(idVuelo);
			StringBuilder detallePaquete = new StringBuilder();

			detallePaquete.append("<p><b>Vuelo seleccionado</b></p>");
			detallePaquete.append("<span>");
			detallePaquete.append("Desde: " + vuelo.getDesde().getDescripcion());
			detallePaquete.append("</span>");
			detallePaquete.append("<br>");
			detallePaquete.append("<span>");
			detallePaquete.append("Hacia: " + vuelo.getHacia().getDescripcion());
			detallePaquete.append("</span>");
			detallePaquete.append("<br>");
			detallePaquete.append("<span>");
			detallePaquete.append("Horario de Partida: " + formatoFecha.format(vuelo.getPartida()));
			detallePaquete.append("</span>");
			detallePaquete.append("<br>");
			detallePaquete.append("<span>");
			detallePaquete.append("Horario de Llegada: " + formatoFecha.format(vuelo.getLlegada()));
			detallePaquete.append("</span>");
			detallePaquete.append("<br>");
			detallePaquete.append("<span>");
			detallePaquete.append("Precio: " + vuelo.getPrecio());
			detallePaquete.append("</span>");
			detallePaquete.append("<br>");
			detallePaquete.append("<span>");
			detallePaquete.append("Disponibilidad: "+ vuelo.getDisponibilidad());
			detallePaquete.append("</span>");
			detallePaquete.append("<br>");
			detallePaquete.append("<button class=\"btn btn-primary\" type=\"button\" id=\"eliminarVuelo\">Eliminar vuelo</button>");

			response.setContentType("text/html");
			response.getWriter().write(detallePaquete.toString());
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().invalidate();
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
