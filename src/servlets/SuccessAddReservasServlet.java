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

public class SuccessAddReservasServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		
		Reserva reserva = new Reserva();
		Paquete paquete = new Paquete();
		PaqueteRepository paqueteRepository = new PaqueteRepository();
		ReservaRepository reservaRepository = new ReservaRepository();
		
		Vuelo vuelo = new Vuelo();
		
		int idPaquete = 0;
		int cantidad = 0;
		String observaciones = "";
		
		
		
		idPaquete = Integer.parseInt(request.getParameter("paquetes"));
//		observaciones = (String) request.getParameter("observaciones");
		
		ArrayList<Cliente> lista = (ArrayList<Cliente>) session.getAttribute("clientesSession");
		if(lista == null)
			request.getRequestDispatcher("Error").forward(request, response);
		reserva.setId(reservaRepository.GetIdBase());
		reserva.setClientes(lista);
		paquete = paqueteRepository.GetByIdBase(idPaquete);
		reserva.setPaquete(paquete);
		reserva.setTotal(paquete.getPrecio()*lista.size());
		
		if(reservaRepository.ValidarDisponibilidad(reserva) >= lista.size())
		{
				if(reservaRepository.InsertarBase(reserva))
				{
					session.setAttribute("clientesSession",null);
					request.getRequestDispatcher("Felicidades").forward(request, response);
				}
		}	
		
//		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
//		
//		ReservaRepository reservaRepository = new ReservaRepository();
//		
//		vuelo= (Vuelo)request.getAttribute("Vuelo");
//		paquete = (Paquete)request.getAttribute("Paquete");
//		clientes = (ArrayList<Cliente>)request.getAttribute("ListaClientes");
//		
//		reserva.setClientes(clientes);
//		reserva.setPaquete(paquete);
//		reserva.setTotal(paquete.getPrecio() * clientes.size());
//		
//		if(reservaRepository.ValidarDisponibilidad(reserva) >= clientes.size())
//		{
//			if(reservaRepository.InsertarBase(reserva))
//			{
//			}
//		}	
		
		
	}

}
