<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Carro editado</h1>
        <hr />
        <%
        //recebe os valores da tela HTML  
            String cpf    = request.getParameter("cpf");
            String nome   = request.getParameter("nome");
            String email  = request.getParameter("email");
            int    cartao = Integer.parseInt(request.getParameter("cartao"));
          
            //instancia o Cliente
            Cliente cliente = new Cliente();
            cliente.setCpf(cpf);
            cliente.setNome(nome);
            cliente.setEmail(email);
            cliente.setNrCartao(cartao);
          
            if(cliente.alterarCliente()){
                response.sendRedirect("consultacliente.jsp?pmensagem=Cliente editado com sucesso");
            } else {
                response.sendRedirect("consultacliente.jsp?pmensagem=Problemas ao editar cliente");
            }          
        %>        
       <hr />
       <a href="consultacliente.jsp">Consulta cliente</a> 
    </body>
</html>
