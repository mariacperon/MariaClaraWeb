<%@page import="modelos.Carro"%>
<%
    Carro carro = new Carro();
 
    carro.setPlaca(request.getParameter("placa"));
    carro.setMarca(request.getParameter("marca"));
    carro.setModelo(request.getParameter("modelo"));
    carro.setKm(Integer.parseInt(request.getParameter("km")));
    
    if (request.getParameter("arcondicionado") != null){
        carro.setArcondicionado(true);
    }
    if (request.getParameter("direcaohidraulica") != null){
        carro.setDirecaohidraulica(true);
    }
   
    if (carro.incluirCarro()) {
            response.sendRedirect("incluircarro.jsp?pmensagem=Carro salvo com sucesso");
    } else {
            response.sendRedirect("incluircarro.jsp?pmensagem=Problemas ao salvar carro");
    }
    
%>
