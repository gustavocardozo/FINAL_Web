package servlets;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.Reserva;
import repository.ReservaRepository;


public class AddReservasServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			
			HttpSession session = request.getSession();
			ReservaRepository reservaRepository  = new ReservaRepository();
			
			Reserva reserva = (session.getAttribute("reserva")==null)? new Reserva() : (Reserva)session.getAttribute("reserva");
			ArrayList<Cliente> clientesAgregados = (session.getAttribute("clientesAgregados")==null)? new ArrayList<Cliente>() : (ArrayList<Cliente>)session.getAttribute("clientesAgregados");  
			reserva.setClientes(clientesAgregados);
			reserva.setTotal(reserva.getPaquete().getPrecio() * reserva.getClientes().size());
			reservaRepository.InsertarBase(reserva);
			
			session.invalidate();
			
			request.getRequestDispatcher("/WEB-INF/Felicidades.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
