<%@page import="com.emergentes.modelo.Tarea"%>
<%
    Tarea item = (Tarea) request.getAttribute("miTarea");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP MVC</title>
    </head>
    <body>
        <h2><%= (item.getId() == 0) ? "Nuevo registro":"Editar registro" %></h2>
        <form action="MainController" method="post">
            <input type="hidden" name="id" value="<%= item.getId() %>"/>
            <table>
                <tr>
                    <td>Tarea:</td>
                    <td><input type="text" name="tarea" value="<%= item.getTarea() %>" required> </td>
                </tr>
                <tr>
                    <td>Prioridad:</td>
                    <td>
                        <% if(item.getId() == 0){%>
                            <select name="prioridad" value="<%= item.getPrioridad() %>" required>
                                <option value=""></option>
                                <option value="Alta">1-Alta</option>
                                <option value="Media">2-Media</option>
                                <option value="Baja">3-Baja</option>
                            </select> 
                        <% }else{
                                switch(item.getPrioridad()){
                                case "Alta": %>
                                <select name="prioridad" value="<%= item.getPrioridad() %>">
                                    <option value="Alta" selected>1-Alta</option>
                                    <option value="Media">2-Media</option>
                                    <option value="Baja">3-Baja</option>
                                </select> 
                                <% break;
                                case "Media": %>
                                <select name="prioridad" value="<%= item.getPrioridad() %>">
                                    <option value="Alta">1-Alta</option>
                                    <option value="Media" selected>2-Media</option>
                                    <option value="Baja">3-Baja</option>
                                </select> 
                                <% break;
                                case "Baja": %>
                                <select name="prioridad" value="<%= item.getPrioridad() %>">
                                    <option value="Alta">1-Alta</option>
                                    <option value="Media">2-Media</option>
                                    <option value="Baja" selected>3-Baja</option>
                                </select> 
                                <%break;
                                }
                            } 
                        %>                          
                    </td>
                </tr>
                <tr>
                    <td>Completado:</td>
                    <td>
                        <% if(item.getId() == 0){%>
                        <input type="radio" name="completado" value="true" required>1-Concluido<br>
                        <input type="radio" name="completado" value="false" required>2-Pendiente
                        <% }else{
                                if(item.isCompletado() == true){%>
                                    <input type="radio" name="completado" value="true" checked>1-Concluido<br>
                                    <input type="radio" name="completado" value="false">2-Pendiente
                                <%}else{%>
                                    <input type="radio" name="completado" value="true">1-Concluido<br>
                                    <input type="radio" name="completado" value="false" checked>2-Pendiente
                                <%}
                            } 
                        %>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Enviar" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
