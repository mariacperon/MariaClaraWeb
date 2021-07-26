<%@page import="modelos.MetodosPagto"%>
<%
    MetodosPagto metodos = new MetodosPagto();
 
    metodos.setCpf(request.getParameter("cpf"));
    metodos.setTipoPagto(request.getParameter("tipopagto"));
    if (metodos.incluirMetodos()) {
        response.sendRedirect("incluirmetodos.jsp?pmensagem=Método salvo com sucesso");
    } else {
        response.sendRedirect("incluirmetodos.jsp?pmensagem=Problemas ao salvar método");
    }
    
%>
