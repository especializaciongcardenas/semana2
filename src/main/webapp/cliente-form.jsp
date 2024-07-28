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
        <link rel="stylesheet" href="css/styles.css">    
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">    
        <link rel="stylesheet" href="css/sweetalert2/sweetalert2.min.css">
    </head>
    <body>
        <section class="p-3 p-md-4 p-xl-5">  
            <div class="container">
                <div class="row">
                    <div class="card sombra col-md-12 p-5">
                        <div class="card col-md-6 mx-auto text-center mb-5 sombra">
                            <h1 class="text-center">${cliente == null ? 'Agregar' : 'Editar'} Cliente</h1>
                        </div>
                        <form action="ClienteServlet?action=${cliente == null ? 'insert' : 'update'}" method="post" autocomplete="off">
                            <c:if test="${cliente != null}">
                                <input type="hidden" name="id_Cliente" value="${cliente.id_Cliente}"/>
                            </c:if>
                            <div class="row text-center mb-4">
                                <div class="col-md-2">
                                    <label for="nombre_1" class="col-form-label">Nombre 1: <span
                                                class="text-danger">*</span></label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="nombre_1" name="nombre_1" class="form-control" value="${cliente.nombre_1}">
                                </div>
                                <div class="col-md-2">
                                    <label for="nombre_2" class="col-form-label">Nombre 2: </label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="nombre_2" name="nombre_2" class="form-control" value="${cliente.nombre_2}">
                                </div>
                            </div>
                            <div class="row text-center mb-4">
                                <div class="col-md-2">
                                    <label for="apellido_1" class="col-form-label">Apellido 1: <span
                                                class="text-danger">*</span></label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="apellido_1" name="apellido_1" class="form-control" value="${cliente.apellido_1}">
                                </div>
                                <div class="col-md-2">
                                    <label for="apellido_2" class="col-form-label">Apellido 2: <span
                                                class="text-danger">*</span></label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="apellido_2" name="apellido_2" class="form-control" value="${cliente.apellido_2}">
                                </div>
                            </div>
                            <div class="row text-center mb-4">
                                <div class="col-md-2">
                                    <label for="tipo_identificacion" class="col-form-label">Tipo Identificacion: <span
                                                class="text-danger">*</span></label>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-select" id="id_Tipo_Identificacion">
                                        <option value="0" selected>Seleccione una opción</option>
                                        <option value="${cliente.id_Tipo_Identificacion}">Tarjeta de Identidad</option>
                                        <option value="${cliente.id_Tipo_Identificacion}">Cedula de Ciudadania</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <label for="identificacion" class="col-form-label">Identificación: <span
                                                class="text-danger">*</span></label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="identificacion" class="form-control" value="${cliente.identificacion}">
                                </div>
                            </div>
                            <div class="row text-center mb-4">
                                <div class="col-md-2">
                                    <label for="domicilio" class="col-form-label">Domicilio: <span
                                                class="text-danger">*</span></label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="domicilio" class="form-control" value="${cliente.domicilio}">
                                </div>
                                <div class="col-md-2">
                                    <label for="email" class="col-form-label">Email: <span
                                                class="text-danger">*</span></label>
                                </div>
                                <div class="col-md-4">
                                    <input type="email" id="email" class="form-control" value="${cliente.email}" placeholder="ejemplo@ejemplo.com">
                                </div>
                            </div>
                            <div class="row text-center mb-4">
                                <div class="col-md-2">
                                    <label for="telefono" class="col-form-label">Teléfono: <span
                                                class="text-danger">*</span></label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="telefono" class="form-control" value="${cliente.telefono}">
                                </div>
                            </div>
                            <div class="row text-center mb-4">
                                <div class="col-md-12">
                                    <input type="button" value="${cliente == null ? 'Registrar' : 'Actualizar'}" class="btn btn-outline-success col-md-4"
                                           onclick="validarFormulario()">
                                    <button id="btn_accion" style="display: none" type="submit"></button>
                                </div>
                            </div>
                        </form>                  
                    </div>
                </div>
            </div>
        </section>      
    </form>
</body>
<script src="js/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>
<script src="js/registerClient.js" type="text/javascript"></script>
</html>
