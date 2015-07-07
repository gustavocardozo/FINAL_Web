package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.Paquete;
import model.Reserva;
import model.Vuelo;
import repository.ClienteRepository;
import repository.PaqueteRepository;
import repository.ReservaRepository;
import repository.VueloRepository;

public class AddPaquete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected ClienteRepository clienteRepository;
    protected ArrayList<Cliente> clientes; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPaquete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			VueloRepository vueloRepository = new VueloRepository();
			PaqueteRepository paqueteRepository = new PaqueteRepository();
			String where = "WHERE DESDE=" + request.getParameter("origen") + " AND HACIA= " + request.getParameter("destino"); 
			
			ArrayList<Vuelo> vuelos = vueloRepository.VuelosBy(where);
			ArrayList<Paquete> paquetes = paqueteRepository.PaquetesBy(where);

			request.setAttribute("paquetes", paquetes);
			request.setAttribute("vuelos", vuelos);
			request.getRequestDispatcher("/WEB-INF/SeleccionarPaquete.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		Integer idPaquete = Integer.parseInt(request.getParameter("idPaquete"));
		Reserva reserva = new Reserva();
		PaqueteRepository paqueteRepository = new PaqueteRepository();
		ReservaRepository reservaRepository = new ReservaRepository();
		
		reserva.setId(reservaRepository.GetIdBase());
		reserva.setPaquete(paqueteRepository.GetByIdBase(idPaquete));
		
		request.getSession().setAttribute("reserva", reserva);
		request.getSession().setAttribute("GET",true);
		
		request.getRequestDispatcher("/SeleccionarClientes").forward(request, response);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
