package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LimpiarSession
 */
@WebServlet("/LimpiarSession")
public class LimpiarSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LimpiarSession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
//			request.getSession().setAttribute("vuelo", null);
//			request.getSession().setAttribute("paquete", null);
//			request.getSession().setAttribute("clientesAgregados", null);
//			request.getSession().setAttribute("reserva", null);
//			request.getSession().setAttribute("destinos", null);
//			request.getSession().setAttribute("clientes", null);
//			request.getSession().setAttribute("doGet", null);
//			request.getSession().setAttribute("modificacion",null);
//			request.getSession().setAttribute("errores",null);
			LimpiarSession.deleteSession(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static void deleteSession(HttpServletRequest request)
	{
		try {
			request.getSession().setAttribute("vuelo", null);
			request.getSession().setAttribute("paquete", null);
			request.getSession().setAttribute("clientesAgregados", null);
			request.getSession().setAttribute("reserva", null);
			request.getSession().setAttribute("destinos", null);
			request.getSession().setAttribute("clientes", null);
			request.getSession().setAttribute("doGet", null);
			request.getSession().setAttribute("modificacion",null);
			request.getSession().setAttribute("errores",null);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
