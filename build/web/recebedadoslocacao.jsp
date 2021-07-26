<%@page import="java.sql.Date"%>
<%@page import="modelos.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
        String placa = request.getParameter("placa");
        String cpfcliente = request.getParameter("cpfcliente");
        String datalocacao = request.getParameter("datalocacao");
        String datareserva = request.getParameter("datareserva");
        String datadevolucao = request.getParameter("datadevolucao");

        Locacao locacao = new Locacao();
        locacao.setPlaca(placa);
        locacao.setCpfCliente(cpfcliente);
        locacao.setDatalocacao(Date.valueOf(datalocacao));
        locacao.setDatadevolucao(Date.valueOf(datadevolucao));
        locacao.setDataReserva(Date.valueOf(datareserva));
         
        if (locacao.incluirLocacao()){
            response.sendRedirect("incluirlocacao.jsp?pmensagem=Locação salva com sucesso");
        }else{
            response.sendRedirect("incluirlocacao.jsp?pmensagem=Problemas ao salvar locação");
        }

        %>
    </body>
</html>
