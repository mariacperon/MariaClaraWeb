<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        
        <h1>Excluir Cliente</h1>
        <%
          String idcpf = request.getParameter("cpf");
          Cliente c = new Cliente();
          if (idcpf != null){
              c = c.consultarCliente(idcpf);
              if(c.excluirCliente()){
                response.sendRedirect("consultacliente.jsp?pmensagem=Cliente excluido com sucesso");
                } else {
                response.sendRedirect("consultacliente.jsp?pmensagem=Problemas ao excluir cliente");
                }
          }          
        %>
        <hr />
       <a href="consultacliente.jsp">Consulta Clientes</a> 
              
    </body>
</html>
