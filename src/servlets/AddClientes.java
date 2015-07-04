package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.Reserva;
import repository.ClienteRepository;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.getSession().setAttribute("clientesAgregados", null);
			clienteRepository = new ClienteRepository();
			reserva = (Reserva)request.getAttribute("reserva");
			clientes = clienteRepository.ListadoBase();
			
			request.setAttribute("clientes", clientes );
			request.getRequestDispatcher("/WEB-INF/SeleccionarClientes.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			Boolean doGet = (Boolean)request.getSession().getAttribute("GET");
			
			if (doGet) {
				request.getSession().setAttribute("GET", false);
				doGet(request,response);
			}
			else
			{
				request.getRequestDispatcher("AgregarReserva").forward(request, response);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
