/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import model.Cliente;
import model.DatabaseConnection;
import java.util.*;

/**
 *
 * @author gcardenas
 */
public class ClienteDAO {
    
    // Método para obtener todos los clientes
    public List<Cliente> getClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM Cliente";

        try (Connection conn = DatabaseConnection.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdentificacion(rs.getInt("Identificacion"));
                cliente.setIdTipoIdentificacion(rs.getInt("Id_Tipo_Identificacion"));
                cliente.setNombre1(rs.getString("Nombre_1"));
                cliente.setNombre2(rs.getString("Nombre_2"));
                cliente.setApellido1(rs.getString("Apellido_1"));
                cliente.setApellido2(rs.getString("Apellido_2"));
                cliente.setDomicilio(rs.getString("Domicilio"));
                cliente.setTelefono(rs.getString("Telefono"));
                cliente.setEmail(rs.getString("Email"));
                cliente.setEstado(rs.getBoolean("Estado"));
                cliente.setFechaRegistro(rs.getTimestamp("Fecha_Registro"));

                clientes.add(cliente);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return clientes;
    }
    
    // Método para agregar un nuevo cliente
    public boolean addCliente(Cliente cliente) {
        String sql = "INSERT INTO Cliente (Id_Tipo_Identificacion, Nombre_1, Nombre_2, Apellido_1, Apellido_2, Domicilio, Telefono, Email, Estado, Fecha_Registro) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, cliente.getIdTipoIdentificacion());
            pstmt.setString(2, cliente.getNombre1());
            pstmt.setString(3, cliente.getNombre2());
            pstmt.setString(4, cliente.getApellido1());
            pstmt.setString(5, cliente.getApellido2());
            pstmt.setString(6, cliente.getDomicilio());
            pstmt.setString(7, cliente.getTelefono());
            pstmt.setString(8, cliente.getEmail());
            pstmt.setBoolean(9, cliente.isEstado());
            pstmt.setTimestamp(10, new Timestamp(cliente.getFechaRegistro().getTime()));

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    // Método para obtener un cliente por su ID
    public Cliente getClienteById(int id) {
        String sql = "SELECT * FROM Cliente WHERE Identificacion = ?";
        Cliente cliente = null;

        try (Connection conn = DatabaseConnection.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                cliente = new Cliente();
                cliente.setIdentificacion(rs.getInt("Identificacion"));
                cliente.setIdTipoIdentificacion(rs.getInt("Id_Tipo_Identificacion"));
                cliente.setNombre1(rs.getString("Nombre_1"));
                cliente.setNombre2(rs.getString("Nombre_2"));
                cliente.setApellido1(rs.getString("Apellido_1"));
                cliente.setApellido2(rs.getString("Apellido_2"));
                cliente.setDomicilio(rs.getString("Domicilio"));
                cliente.setTelefono(rs.getString("Telefono"));
                cliente.setEmail(rs.getString("Email"));
                cliente.setEstado(rs.getBoolean("Estado"));
                cliente.setFechaRegistro(rs.getTimestamp("Fecha_Registro"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return cliente;
    }
    
    // Método para actualizar un cliente
    public boolean updateCliente(Cliente cliente) {
        String sql = "UPDATE Cliente SET Id_Tipo_Identificacion = ?, Nombre_1 = ?, Nombre_2 = ?, Apellido_1 = ?, Apellido_2 = ?, Domicilio = ?, Telefono = ?, Email = ?, Estado = ?, Fecha_Registro = ? WHERE Identificacion = ?";

        try (Connection conn = DatabaseConnection.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, cliente.getIdTipoIdentificacion());
            pstmt.setString(2, cliente.getNombre1());
            pstmt.setString(3, cliente.getNombre2());
            pstmt.setString(4, cliente.getApellido1());
            pstmt.setString(5, cliente.getApellido2());
            pstmt.setString(6, cliente.getDomicilio());
            pstmt.setString(7, cliente.getTelefono());
            pstmt.setString(8, cliente.getEmail());
            pstmt.setBoolean(9, cliente.isEstado());
            pstmt.setTimestamp(10, new Timestamp(cliente.getFechaRegistro().getTime()));
            pstmt.setInt(11, cliente.getIdentificacion());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    
    
}
