<%-- 
    Document   : cliente-form
    Created on : 28/07/2024, 11:24:41 a. m.
    Author     : gcardenas
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Cliente</title>
</head>
<body>
    <h1>${cliente == null ? 'Agregar' : 'Editar'} Cliente</h1>
    <form action="ClienteServlet?action=${cliente == null ? 'insert' : 'update'}" method="post">
        <c:if test="${cliente != null}">
            <input type="hidden" name="id_Cliente" value="${cliente.id_Cliente}"/>
        </c:if>
        <label for="identificacion">Identificación:</label>
        <input type="text" name="identificacion" value="${cliente.identificacion}" required/><br/>
        <label for="id_Tipo_Identificacion">Tipo de Identificación:</label>
        <input type="text" name="id_Tipo_Identificacion" value="${cliente.id_Tipo_Identificacion}" required/><br/>
        <label for="nombre_1">Primer Nombre:</label>
        <input type="text" name="nombre_1" value="${cliente.nombre_1}" required/><br/>
        <label for="nombre_2">Segundo Nombre:</label>
        <input type="text" name="nombre_2" value="${cliente.nombre_2}"/><br/>
        <label for="apellido_1">Primer Apellido:</label>
        <input type="text" name="apellido_1" value="${cliente.apellido_1}" required/><br/>
        <label for="apellido_2">Segundo Apellido:</label>
        <input type="text" name="apellido_2" value="${cliente.apellido_2}"/><br/>
        <label for="domicilio">Domicilio:</label>
        <input type="text" name="domicilio" value="${cliente.domicilio}" required/><br/>
        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" value="${cliente.telefono}" required/><br/>
        <label for="email">Email:</label>
        <input type="email" name="email" value="${cliente.email}" required/><br/>
        <label for="estado">Estado:</label>
        <input type="checkbox" name="estado" ${cliente.estado ? 'checked' : ''}/><br/>
        <button type="submit">${cliente == null ? 'Agregar' : 'Actualizar'}</button>
    </form>
</body>
</html>
