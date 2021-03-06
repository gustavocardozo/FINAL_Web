package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.Cliente;
import repository.ClienteRepository;

public class GetCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected ClienteRepository clienteRepository;
	protected ArrayList<Cliente> clientes;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetCliente() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			clienteRepository = new ClienteRepository();
			Integer idCliente = Integer.parseInt(request.getParameter("idCliente"));
			Cliente cliente = clienteRepository.GetByIdBase(idCliente);

			StringBuilder detalleCliente = new StringBuilder();

			detalleCliente.append("<table class='table table-striped'><tr><td>");
			detalleCliente.append("Nombre</td><td>" + cliente.getNombre());
			detalleCliente.append("</td></tr>");

			detalleCliente.append("<tr><td>");
			detalleCliente.append("Apellido</td><td>" + cliente.getApellido());
			detalleCliente.append("</td></tr>");

			detalleCliente.append("<tr><td>");
			detalleCliente.append("Fecha de Nacimiento</td><td>" + cliente.getFecha_nacimiento());
			detalleCliente.append("</td></tr>");

			detalleCliente.append("<tr><td>");
			detalleCliente.append("DNI</td><td>" + cliente.getDni());
			detalleCliente.append("</td></tr>");

			detalleCliente.append("<tr><td>");
			detalleCliente.append("Domicilio</td><td>" + cliente.getDireccion());
			detalleCliente.append("</td></tr>");

			detalleCliente.append("<tr><td>");
			detalleCliente.append("EMAIL</td><td>" + cliente.getEmail());
			detalleCliente.append("</td></tr>");

			detalleCliente.append("<tr><td>");
			detalleCliente.append("Telefono</td><td>" + cliente.getTelefono());
			detalleCliente.append("</td></tr>");
			detalleCliente.append("</table>");
			detalleCliente.append("<button class=\"btn btn-primary\" type=\"button\" id=\"agregar\">Agregar</button>");
			
			
			
			response.setContentType("text/html");
			response.getWriter().write(detalleCliente.toString());

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().invalidate();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HashSet<Cliente> hsClientes = new HashSet<Cliente>();
			clienteRepository = new ClienteRepository();
			HttpSession session = request.getSession();
			clientes = (ArrayList<Cliente>)session.getAttribute("clientesAgregados");
			
			
//			if(hsClientes == null)hsClientes=   new HashSet<Cliente>();
			if(clientes == null)clientes=   new ArrayList<Cliente>();
			hsClientes = new HashSet<Cliente>(clientes);
					
//					(request.getAttribute("ClientesAgregados")== null) ? new ArrayList<Cliente>() : (ArrayList<Cliente>)request.getAttribute("ClientesAgregados");
			Integer idCliente = Integer.parseInt(request.getParameter("idCliente"));
			Cliente cliente = clienteRepository.GetByIdBase(idCliente);

			String accion = request.getParameter("accion").toString();
			switch (accion) {
			case "add":
//				clientes.add(cliente);	
				hsClientes.add(cliente);
				break;
			case "delete":
//				clientes.remove(cliente);
				hsClientes.remove(cliente);
			default:
				break;
			}
			
			session.setAttribute("clientesAgregados", new ArrayList<Cliente>(hsClientes));
//			session.setAttribute("hsClientes", hsClientes);
			
			String listadoCliente = new Gson().toJson(new ArrayList<Cliente>(hsClientes));
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(listadoCliente);

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().invalidate();
		}
	}

}
