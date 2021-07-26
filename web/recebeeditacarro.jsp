<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Carro editado</h1>
        <hr />
        <%
        //recebe os valores da tela HTML  
          String placa = request.getParameter("placa");
          String marca = request.getParameter("marca");
          String modelo = request.getParameter("modelo");
          String km = request.getParameter("km");
          String arcondicionado = request.getParameter("arcondicionado");
          String direcaohidraulico = request.getParameter("direcaohidraulica");
          
          //instancia o carro
          Carro carro = new Carro();
          carro.setPlaca(placa);
          carro.setModelo(modelo);
          carro.setMarca(marca);
          
          if(!km.equals(""))
             carro.setKm(Integer.parseInt(km));            
         
          if (arcondicionado != null)
             carro.setArcondicionado(true);
          
          if(direcaohidraulico != null)
            carro.setDirecaohidraulica(true);
          
          
          if(carro.alterarCarro()){
                response.sendRedirect("consultacarro.jsp?pmensagem=Carro editado com sucesso");
            } else {
                response.sendRedirect("consultacarro.jsp?pmensagem=Problemas ao editar carro");
            }     
        %>        
       <hr />
       <a href="consultacarro.jsp">Consulta carros</a> 
        
    </body>
</html>
