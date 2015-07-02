package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import repository.*;

public class AddReservasServlet extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		ClienteRepository clienteRepository = new ClienteRepository();
		PaqueteRepository paqueteRepository = new PaqueteRepository();
		
		
		for(Cliente clie : clienteRepository.ListadoBase())
		{
			System.out.println("Cliente: "+clie.getId());
			
		}
		
		
		//request.setAttribute("clientesSession",);
		request.setAttribute("clientes", clienteRepository.ListadoBase());
		request.setAttribute("paquetes", paqueteRepository.ListadoBase());
		
	
		request.getRequestDispatcher("/AgregarReserva.jsp").forward(request, response);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClienteRepository clienteRepository = new ClienteRepository();
		HttpSession session= request.getSession();
		
		if(request.getParameter("agregarcliente") != null){
			ArrayList<Cliente> lista = (ArrayList<Cliente>) session.getAttribute("clientesSession");
			if(lista != null){
				if(lista.size() > 0)
				{
					lista.add(clienteRepository.GetByIdBase(Integer.parseInt(request.getParameter("agregarcliente"))));
					session.setAttribute("clientesSession",lista);
					System.out.println("Agrege uno mas a la lista de clientes de session");
				}else{
					session.setAttribute("clientesSession",clienteRepository.GetByIdBase(Integer.parseInt(request.getParameter("agregarcliente"))));
					System.out.println("Agrege uno solo");
				}
			}else{
				lista = new ArrayList<Cliente>();
				lista.add(clienteRepository.GetByIdBase(Integer.parseInt(request.getParameter("agregarcliente"))));
				session.setAttribute("clientesSession",lista);
				System.out.println("Agrege uno solo");
				System.out.println("No pude agregar al cliente");
			}
			
		}else{
			System.out.println("No hay parametros.");
		}
		
		int contClientes = 0;
		ArrayList<Cliente> clientesS = (ArrayList<Cliente>) session.getAttribute("clientesSession");
		if(clientesS != null)
			contClientes = clientesS.size();
		else
			contClientes = 0;
		
		request.setAttribute("CantClientes", contClientes);
		
		doAction(request, response);
	}

}
