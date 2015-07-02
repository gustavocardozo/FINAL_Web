package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.Reserva;
import repository.*;

public class UpdateReservaServlet extends GenericServlet {

	/**
* 
*/
	private static final long serialVersionUID = 1L;

	@Override
	public void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReservaRepository reservaRepository = new ReservaRepository();
		ClienteRepository clienteRepository = new ClienteRepository();
		PaqueteRepository paqueteRepository = new PaqueteRepository();
		if (request.getParameter("id") != null) {

			HttpSession session = request.getSession();

			Reserva reserva = new Reserva();
			reserva = reservaRepository.GetByIdBase(Integer.parseInt(request
					.getParameter("id")));

			session.setAttribute("clientesReserva", reserva.getClientes());

			request.setAttribute("clientesReservaLista",
					session.getAttribute("clientesReserva"));
			request.setAttribute("clientes", clienteRepository.ListadoBase());
			request.setAttribute("paquetes", paqueteRepository.ListadoBase());
			request.setAttribute("reserva", reserva);
			request.setAttribute("idReserva", request.getParameter("id"));

			request.getRequestDispatcher("/UpdateReserva.jsp").forward(request,
					response);
		} else if (request.getParameter("eliminarcliente") != null) {

		} else if (request.getParameter("agregarcliente") != null) {
			HttpSession session = request.getSession();
			ArrayList<Cliente> lista = (ArrayList<Cliente>) session
					.getAttribute("clientesReserva");
			if (lista != null) {
				if (lista.size() > 0) {
					lista.add(clienteRepository.GetByIdBase(Integer
							.parseInt(request.getParameter("agregarcliente"))));
					session.setAttribute("clientesReserva", lista);
					System.out
							.println("Agrege uno mas a la lista de clientes de session");
				} else {
					session.setAttribute("clientesReserva", clienteRepository
							.GetByIdBase(Integer.parseInt(request
									.getParameter("agregarcliente"))));
					System.out.println("Agrege uno solo");
				}
			} else {
				lista = new ArrayList<Cliente>();
				lista.add(clienteRepository.GetByIdBase(Integer
						.parseInt(request.getParameter("agregarcliente"))));
				session.setAttribute("clientesReserva", lista);
				System.out.println("Agrege uno solo");
				System.out.println("No pude agregar al cliente");
			}
			request.getRequestDispatcher(
					"/?id=" + request.getParameter("agregarcliente")).forward(
					request, response);
		} else {
			request.setAttribute("reservas", reservaRepository.ListadoBase());

			request.getRequestDispatcher("/ListadoReservas.jsp").forward(
					request, response);
		}

	}

}