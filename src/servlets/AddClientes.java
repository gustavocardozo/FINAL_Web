package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.Reserva;
import repository.ClienteRepository;
import repository.ReservaRepository;

public class AddClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected ClienteRepository clienteRepository;
	protected ArrayList<Cliente> clientes;
	protected Reserva reserva;

	public AddClientes() {
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
			clienteRepository = new ClienteRepository();
			reserva = (Reserva) request.getAttribute("reserva");
			clientes = clienteRepository.ListadoBase();

			request.getSession().setAttribute("clientes", clientes);
			request.setAttribute("clientes", clientes);
			request.getRequestDispatcher("/WEB-INF/SeleccionarClientes.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().invalidate();
			try {
				request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<String> errores = new ArrayList<String>();
			if ((Boolean) request.getSession().getAttribute("doGet")) {
				request.getSession().setAttribute("doGet", false);
				doGet(request, response);
			} else {

				HttpSession session = request.getSession();
				ReservaRepository reservaRepository = new ReservaRepository();

				Reserva reserva = (session.getAttribute("reserva") == null) ? new Reserva()
						: (Reserva) session.getAttribute("reserva");
				ArrayList<Cliente> clientesAgregados = (session.getAttribute("clientesAgregados") == null)
						? new ArrayList<Cliente>() : (ArrayList<Cliente>) session.getAttribute("clientesAgregados");
				reserva.setClientes(clientesAgregados);
				
				if(reserva.getClientes().size() <= 0){
					
					errores.add("Debe seleccionar al menos un cliente.");
					request.getSession().setAttribute("errores", errores);
					request.setAttribute("clientes", request.getSession().getAttribute("clientes"));
					request.setAttribute("clientes", request.getSession().getAttribute("clientesAgregados"));
					request.setAttribute("errores", errores);
					request.getRequestDispatcher("/WEB-INF/SeleccionarClientes.jsp").forward(request, response);
				}
				else
				{
					Integer disponibilidad = reserva.getVuelo().getDisponibilidad();
					
					if((boolean)((request.getSession().getAttribute("modificacion")==null)?false:request.getSession().getAttribute("modificacion")))
					{
						disponibilidad += Integer.parseInt((request.getSession().getAttribute("cantidadVieja").toString()==null)?"0":request.getSession().getAttribute("cantidadVieja").toString());
					}
					if ( disponibilidad >= reserva.getClientes().size()) {
						reserva.setTotal(reserva.getPaquete().getPrecio() * reserva.getClientes().size()
								+ reserva.getClientes().size() * reserva.getVuelo().getPrecio());
						session.setAttribute("reserva", reserva);

						request.getRequestDispatcher("SuccessAddReservas").forward(request, response);
					} else {


						errores.add("No hay disponibilidad en el vuelo. Seleccione otro.");
						request.setAttribute("clientes", request.getSession().getAttribute("clientes"));
						request.setAttribute("clientes", request.getSession().getAttribute("clientesAgregados"));
						request.setAttribute("errores", errores);
						request.getRequestDispatcher("/WEB-INF/SeleccionarClientes.jsp").forward(request, response);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().invalidate();
			try {
				request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
