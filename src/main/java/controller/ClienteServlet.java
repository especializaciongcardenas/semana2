package controller;


import dao.ClienteDAO;
import model.Cliente;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author gcardenas
 */
@WebServlet("/ClienteServlet")
public class ClienteServlet {
    
    private ClienteDAO clienteDAO;
    
    public void init(){
        clienteDAO = new ClienteDAO();
    }
    
    protected void doGet(HttpServletRequest  request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listClientes(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "insert":
                insertCliente(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                listClientes(request, response);
                break;
        }
    }
    
    private void listClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Cliente> listaClientes = clienteDAO.getClientes();
        request.setAttribute("listaClientes", listaClientes);
        request.getRequestDispatcher("cliente-list.jsp").forward(request, response);
    }
    
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cliente-form.jsp").forward(request, response);
    }
    
    private void insertCliente(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int idTipoIdentificacion = Integer.parseInt(request.getParameter("idTipoIdentificacion"));
        String nombre1 = request.getParameter("nombre1");
        String nombre2 = request.getParameter("nombre2");
        String apellido1 = request.getParameter("apellido1");
        String apellido2 = request.getParameter("apellido2");
        String domicilio = request.getParameter("domicilio");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        boolean estado = Boolean.parseBoolean(request.getParameter("estado"));
        Cliente cliente = new Cliente();
        cliente.setIdTipoIdentificacion(idTipoIdentificacion);
        cliente.setNombre1(nombre1);
        cliente.setNombre2(nombre2);
        cliente.setApellido1(apellido1);
        cliente.setApellido2(apellido2);
        cliente.setDomicilio(domicilio);
        cliente.setTelefono(telefono);
        cliente.setEmail(email);
        cliente.setEstado(estado);
        cliente.setFechaRegistro(new java.util.Date());

        clienteDAO.addCliente(cliente);
        response.sendRedirect("ClienteServlet?action=list");
    }
    
    
     private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente existingCliente = clienteDAO.getClienteById(id);
        request.setAttribute("cliente", existingCliente);
        request.getRequestDispatcher("cliente-form.jsp").forward(request, response);
    }
    
    
    
    

    
    
    
    
    
    
    
}
