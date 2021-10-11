<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Tarea"%>
<%
    ArrayList<Tarea> lista = (ArrayList<Tarea>) session.getAttribute("listarea");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP MVC</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js" integrity="sha512-qzgd5cYSZcosqpzpn7zF2ZId8f/8CHmFKZ8j7mU4OUXTNRd5g+ZHBPsgKEwoqxCtdQvExE5LprwwPAgoicguNg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>      
    </head>
    <body>  
        <h1>Lista de tareas</h1>
        <a href="MainController?op=nuevo">Nuevo</a><p></p>
        <table border="2" rules="all" id="myTable" class="tablesorter" > 
        <thead>
            <tr>
                <th data-sorter="false">Id</th>
                <th>Tarea &nbsp;&#x25B4;&#x25BE;</th> 
                <th data-sorter="false">Prioridad</th>
                <th data-sorter="false">Completado</th>
                <th data-sorter="false"></th>
                <th data-sorter="false"></th>
            </tr>
        </thead>
        <tbody>
            <%
                if (lista != null){
                    for (Tarea item : lista){
            %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getTarea() %> </td>
                <td><%= item.getPrioridad() %></td>
                <td><%= (item.isCompletado() == true) ?
                "<input type='checkbox' readonly='readonly' onclick='javascript: return false;' checked>" : 
                "<input type='checkbox' readonly='readonly' onclick='javascript: return false;'>" %></td>
                <td><a href="MainController?op=editar&id=<%= item.getId() %>">Editar</a></td>
                <td><a href="MainController?op=eliminar&id=<%= item.getId() %>"
                       onclick="return confirm('Está seguro de eliminar el registro ?');">Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
        </table>
        <script type='text/javascript'>
            $(document).ready(function(){
            $("#myTable").tablesorter();
            }); 
        </script>
    </body>
</html>
