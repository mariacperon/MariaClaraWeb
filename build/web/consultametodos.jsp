<%@page import="java.util.List"%>
<%@page import="modelos.MetodosPagto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Métodos</title>
    </head>
    <body>
        <body>
        <script src="scripts/menu.js"></script>  
        <h1>Consulta Métodos de Pagamento</h1>
        <hr />
        <%
          MetodosPagto metodos = new MetodosPagto();
          List<MetodosPagto> metodoconsulta = metodos.consultarGeral();
        %>
        <table>
            <thead>
              <th>CPF</th>
              <th>TIPO DE PAGAMENTO</th>
            </thead>
            <tbody>
                <% for(MetodosPagto m : metodoconsulta) { %>
                   <tr>
                        <td><% out.write(m.getCpf());   %></td>
                        <td><% out.write(m.getTipoPagto());  %></td>     
                        <td><%out.write("<a href=editarmetodo.jsp?cpf="+m.getCpf()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirmetodo.jsp?cpf="+m.getCpf()+">Excluir</a>");%></td>   
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
