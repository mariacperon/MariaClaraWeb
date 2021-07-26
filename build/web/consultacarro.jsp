<%@page import="java.util.List"%>
<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <body>
        <script src="scripts/menu.js"></script>  
        <h1>Consulta Carros</h1>
        <hr />
        <%
          Carro carro = new Carro();
          List<Carro> carros = carro.consultarGeral();
        %>
        <table>
            <thead>
              <th>Placa</th>
              <th>Marca</th>
              <th>Modelo</th>
              <th>KM</th>
              <th>Ar Condicionado</th>
              <th>Direção Hidraulica</th>
            </thead>
            <tbody>
                <% for(Carro c : carros ) { %>
                   <tr>
                        <td><% out.write(c.getPlaca());   %></td>
                        <td><% out.write(c.getMarca());  %></td>
                        <td><% out.write(c.getModelo()); %></td>
                        <td><% out.write(""+c.getKm()); %></td>
                        <%
                           if(c.isArcondicionado()){
                              out.write("<td>Sim</td>");
                           }
                           else{
                           out.write("<td>Não</td>");  
                           }                       
                         %>
                        <!-- Valida direção hidraulica-->
                         <%
                           if(c.isDirecaohidraulica()){
                              out.write("<td>Sim</td>");
                           }
                           else{
                             out.write("<td>Não</td>");  
                           }                       
                         %>  
                        
                        <td><%out.write("<a href=editarcarro.jsp?placa="+c.getPlaca()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluircarro.jsp?placa="+c.getPlaca()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
