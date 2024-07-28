<%-- 
    Document   : index
    Created on : 25/07/2024, 8:43:48 p. m.
    Author     : gcardenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Clientes</title>
</head>
<body>
    <h1>Lista de Clientes</h1>
    <a href="ClienteServlet?action=add">Agregar Nuevo Cliente</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tipo de Identificación</th>
            <th>Primer Nombre</th>
            <th>Segundo Nombre</th>
            <th>Primer Apellido</th>
            <th>Segundo Apellido</th>
            <th>Domicilio</th>
            <th>Teléfono</th>
            <th>Email</th>
            <th>Estado</th>
            <th>Fecha de Registro</th>
            <th>Acciones</th>
        </tr>
        <c:forEach var="cliente" items="${listaClientes}">
            <tr>
                <td>${cliente.identificacion}</td>
                <td>${cliente.idTipoIdentificacion}</td>
                <td>${cliente.nombre1}</td>
                <td>${cliente.nombre2}</td>
                <td>${cliente.apellido1}</td>
                <td>${cliente.apellido2}</td>
                <td>${cliente.domicilio}</td>
                <td>${cliente.telefono}</td>
                <td>${cliente.email}</td>
                <td>${cliente.estado}</td>
                <td>${cliente.fechaRegistro}</td>
                <td>
                    <a href="ClienteServlet?action=edit&id=${cliente.identificacion}">Editar</a>
                    <a href="ClienteServlet?action=delete&id=${cliente.identificacion}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>