<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <%
          String placa = request.getParameter("placa");
          Carro c = new Carro();
          if (placa != null){
            c = c.consultarCarro(placa);
            if(c.excluirCarro()){
                response.sendRedirect("consultacarro.jsp?pmensagem=Carro excluido com sucesso");
            } else {
                response.sendRedirect("consultacarro.jsp?pmensagem=Problemas ao excluir carro");
            }
          }          
        %>
        <hr />
       <a href="consultacarro.jsp">Consulta carros</a> 
              
    </body>
</html>
