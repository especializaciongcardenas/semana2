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
        <link rel="stylesheet" href="css/styles.css">    
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
    </head>
    <body>
        <section class="p-3 p-md-4 p-xl-5">
            <div class="container">
                <div class="row">
                    <div class="card sombra col-md-12 p-5 table-responsive">
                        <div class="card col-md-6 mx-auto text-center mb-5 sombra">
                            <h1 class="text-center">Clientes</h1>
                        </div>
                        <a type="button" class="btn btn-outline-info col-md-4 mb-5" href="ClienteServlet?action=add">Agregar Nuevo Cliente</a>
                        <form action="ClienteServlet?action=${cliente == null ? 'insert' : 'update'}" method="post">
                            <table class="table table-striped table-bordered col-md-12 text-center">
                                <thead>
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
                                </thead>
                                <tbody>
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
                                </tbody>
                            </table>
                        </form>                   
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>