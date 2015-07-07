package servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.*;



public class UpdateReservaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public UpdateReservaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			Integer idReserva = Integer.parseInt(request.getParameter("idReserva"));
			
//			ReservaRepository reservaRepository = new ReservaRepository();
			
//			request.setAttribute("reserva", reservaRepository.GetByIdBase(idReserva));
			
			request.getRequestDispatcher("/UpdateReserva").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}