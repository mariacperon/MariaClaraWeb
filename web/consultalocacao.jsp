<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Locacao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
          SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");  
            
          Locacao locacao = new Locacao();
          List<Locacao> locacoes = new ArrayList();
        %>
        
        <script src="scripts/menu.js"></script>  
        <h1>Consulta Locação</h1>
        <table>
            <thead>
              <th>CPF</th>
              <th>Placa</th>
              <th>Data locacacao</th>
              <th>Data devolucao</th>
              <th>Data reserva</th>
            </thead>
            <tbody>
                <% for(Locacao loc : locacoes) { %>
                   <tr>
                        <td><% out.write(loc.getCpfCliente());   %></td>
                        <td><% out.write(loc.getPlaca());  %></td>
                        <td><% out.write(String.valueOf(formato.format(loc.getDatalocacao()))); %></td>
                        <td><% out.write(String.valueOf(formato.format(loc.getDatadevolucao()))); %></td>
                        <td><% out.write(String.valueOf(formato.format(loc.getDataReserva()))); %></td>
                        <td><%out.write("<a href=editarlocacao.jsp?cpf="+loc.getId()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirlocacao.jsp?cpf="+loc.getId()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>   
        </form>
    </body>
</html>
