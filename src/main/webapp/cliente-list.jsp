<%-- 
    Document   : cliente-list
    Created on : 27/07/2024, 7:23:52 p. m.
    Author     : gcardenas
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
            <th>Identificación</th>
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
                <td>${cliente.id_Cliente}</td>
                <td>${cliente.identificacion}</td>
                <td>${cliente.id_Tipo_Identificacion}</td>
                <td>${cliente.nombre_1}</td>
                <td>${cliente.nombre_2}</td>
                <td>${cliente.apellido_1}</td>
                <td>${cliente.apellido_2}</td>
                <td>${cliente.domicilio}</td>
                <td>${cliente.telefono}</td>
                <td>${cliente.email}</td>
                <td>${cliente.estado}</td>
                <td>${cliente.fecha_Registro}</td>
                <td>
                    <a href="ClienteServlet?action=edit&id=${cliente.id_Cliente}">Editar</a>
                    <a href="ClienteServlet?action=delete&id=${cliente.id_Cliente}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>