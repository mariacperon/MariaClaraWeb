<%@page import="modelos.MetodosPagto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        
        <h1>Excluir Método</h1>
        <%
          String idcpf = request.getParameter("cpf");
          MetodosPagto m = new MetodosPagto();
          if (idcpf != null){
              m = m.consultarMetodo(idcpf); 
              if(m.excluirMetodo()){
                response.sendRedirect("consultametodos.jsp?pmensagem=Cliente excluido com sucesso");
                } else {
                    response.sendRedirect("consultametodos.jsp?pmensagem=Problemas ao excluir cliente");
                }
          }          
        %>
        <hr />
       <a href="consultametodos.jsp">Consulta Métodos</a> 
              
    </body>
</html>
