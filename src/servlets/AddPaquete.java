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
				
				
				request.getSession().setAttribute("paquetes", paquetes);
				request.getSession().setAttribute("vuelos", vuelos);
				
				request.setAttribute("vuelo", request.getSession().getAttribute("vuelo"));
				request.setAttribute("paquete", request.getSession().getAttribute("paquete"));
				request.setAttribute("paquetes", paquetes);
				request.setAttribute("vuelos", vuelos);
				request.getRequestDispatcher("/WEB-INF/SeleccionarPaquete.jsp").forward(request, response);				
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			
			if((boolean) request.getSession().getAttribute("doGet"))
			{
				request.getSession().setAttribute("doGet", false);
				doGet(request, response);
			}
			else
			{
				if(request.getParameter("idVuelo").equals("") || request.getParameter("idVuelo").equals("0"))
				{
					ArrayList<String> errores = new ArrayList<String>();
					
					errores.add("Debe seleccionar por lo menos un vuelo.");
					request.setAttribute("errores", errores);
					request.setAttribute("vuelos", request.getSession().getAttribute("vuelos"));
					request.setAttribute("paquetes", request.getSession().getAttribute("paquetes"));
					request.getRequestDispatcher("/WEB-INF/SeleccionarPaquete.jsp").forward(request, response);
				}
				else
				{
					Integer idVuelo = Integer.parseInt(request.getParameter("idVuelo"));
					Integer idPaquete = Integer.parseInt((request.getParameter("idPaquete").equals(""))? "0":request.getParameter("idPaquete"));
					Reserva reserva = new Reserva();
					PaqueteRepository paqueteRepository = new PaqueteRepository();
					VueloRepository vueloRepository = new VueloRepository();
					ReservaRepository reservaRepository = new ReservaRepository();
					
					
					if(!(boolean)((request.getSession().getAttribute("modificacion")==null)?false:request.getSession().getAttribute("modificacion")))
					{
						reserva.setId(reservaRepository.GetIdBase());
					}
					else
					{
						reserva = (Reserva) request.getSession().getAttribute("reserva");
					}
					
					
					if (!idPaquete.equals(0)) {
						reserva.setPaquete(paqueteRepository.GetByIdBase(idPaquete));
					}
					else
					{
						Paquete paquete= new Paquete();
//						paquete.setId(0);
						reserva.setPaquete(paquete);
					}
//					reserva.setVuelo(new Vuelo());
					reserva.setVuelo(vueloRepository.GetByIdBase(idVuelo));
					
					request.getSession().setAttribute("reserva", reserva);
					request.getSession().setAttribute("doGet",true);
					
					request.getRequestDispatcher("/SeleccionarClientes").forward(request, response);
				}
			}
		
		
		}
		catch(Exception e)
		{
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
