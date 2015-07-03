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
import repository.ClienteRepository;
import repository.PaqueteRepository;

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
			PaqueteRepository paqueteRepository = new PaqueteRepository();
			ArrayList<Paquete> paquetes = paqueteRepository.ListadoBase();

			request.setAttribute("paquetes", paquetes);
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
		
		reserva.setPaquete(paqueteRepository.GetByIdBase(idPaquete));
		
		request.setAttribute("reserva", reserva);
		request.setAttribute("GET", true);
		
		request.getRequestDispatcher("/SeleccionarClientes").forward(request, response);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
