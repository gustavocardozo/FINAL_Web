package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.ReservaRepository;
import model.*;


public class SuccessUpdateReservaServlet extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		Reserva r = (Reserva)request.getAttribute("reserva");
		ReservaRepository reservaRepository = new ReservaRepository();
		
		
		if(reservaRepository.ModificarBase(r))
		{
			boolean $var = true;
		}
			
		
		
		
		
		
		
		
		
		
	}

}
