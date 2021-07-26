<%@page import="modelos.MetodosPagto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Método editado</h1>
        <hr />
        <%
        //recebe os valores da tela HTML  
            String cpf         = request.getParameter("cpf");
            String tipopagto   = request.getParameter("tipopagto");
          
            //instancia o Cliente
            MetodosPagto m = new MetodosPagto();
            m.setCpf(cpf);
            m.setTipoPagto(tipopagto);
          
            if(m.alterarMetodo()){
                response.sendRedirect("consultametodos.jsp?pmensagem=Cliente editado com sucesso");
            } else {
                response.sendRedirect("consultametodos.jsp?pmensagem=Problemas ao editar cliente");
            }          
        %>        
       <hr />
       <a href="consultamedotos.jsp">Consulta método</a> 
    </body>
</html>
