package servlets;

import java.io.IOException;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.Reserva;
import repository.*;

public class UpdateReservaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UpdateReservaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			if (request.getSession().getAttribute("usuario") != null) {
				ReservaRepository reservaRepository = new ReservaRepository();
				DestinoRepository destinoRepository = new DestinoRepository();

				if (request.getParameter("idReserva") != null) {
					Integer idReserva = Integer.parseInt(request.getParameter("idReserva"));
					Reserva reserva = reservaRepository.GetByIdBase(idReserva);
					request.getSession().setAttribute("reserva", reserva);
					request.getSession().setAttribute("clientesAgregados", reserva.getClientes());
					request.getSession().setAttribute("vuelo", reserva.getVuelo());
					request.getSession().setAttribute("paquete", reserva.getPaquete());
					request.getSession().setAttribute("destinos", destinoRepository.ListadoBase());
					request.getSession().setAttribute("cantidadVieja", reserva.getClientes().size());
					request.getSession().setAttribute("modificacion", true);

					request.setAttribute("usuario", request.getSession().getAttribute("usuario"));
					request.setAttribute("reserva", reserva);
					request.setAttribute("vuelo", reserva.getVuelo());
					request.setAttribute("paquete", reserva.getPaquete());
					request.getRequestDispatcher("/WEB-INF/SeleccionarDestinos.jsp").forward(request, response);
					return;
				}
				request.setAttribute("usuario", request.getSession().getAttribute("usuario"));
				request.setAttribute("reservas", reservaRepository.ListadoBase());
				request.getRequestDispatcher("/WEB-INF/ListadoReservas.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/LogIn").forward(request, response);
			}
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