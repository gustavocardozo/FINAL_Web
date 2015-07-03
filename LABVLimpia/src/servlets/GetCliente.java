package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

			detalleCliente.append("<p>");
			detalleCliente.append("Nombre: " + cliente.getNombre());
			detalleCliente.append("</p>");
			detalleCliente.append("<br>");
			detalleCliente.append("<p>");
			detalleCliente.append("Apellido:" + cliente.getApellido());
			detalleCliente.append("</p>");
			detalleCliente.append("<br>");
			detalleCliente.append("<p>");
			detalleCliente.append("Fecha de Nacimiento: " + cliente.getFecha_nacimiento());
			detalleCliente.append("</p>");
			detalleCliente.append("<br>");
			detalleCliente.append("<p>");
			detalleCliente.append("DU: " + cliente.getDni());
			detalleCliente.append("</p>");
			detalleCliente.append("<br>");
			detalleCliente.append("<p>");
			detalleCliente.append("Domicilio: " + cliente.getDireccion());
			detalleCliente.append("</p>");
			detalleCliente.append("<br>");
			detalleCliente.append("<p>");
			detalleCliente.append("EMAIL: " + cliente.getEmail());
			detalleCliente.append("</p>");
			detalleCliente.append("<br>");
			detalleCliente.append("<p>");
			detalleCliente.append("Telefono: " + cliente.getTelefono());
			detalleCliente.append("</p>");
			detalleCliente.append("<br>");
			detalleCliente.append("<button type=\"button\" id=\"agregar\">Agregar</button>");

			response.setContentType("text/html");
			response.getWriter().write(detalleCliente.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			clienteRepository = new ClienteRepository();
			if(clientes == null)clientes=   new ArrayList<Cliente>();
					
//					(request.getAttribute("ClientesAgregados")== null) ? new ArrayList<Cliente>() : (ArrayList<Cliente>)request.getAttribute("ClientesAgregados");
			Integer idCliente = Integer.parseInt(request.getParameter("idCliente"));
			Cliente cliente = clienteRepository.GetByIdBase(idCliente);

			clientes.add(cliente);

			request.setAttribute("ClientesAgregados", clientes);
			
			String listadoCliente = new Gson().toJson(clientes);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(listadoCliente);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
