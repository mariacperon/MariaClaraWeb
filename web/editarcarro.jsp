<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <nav>
        <script src="scripts/menu.js"></script> 
    </nav>
    <body>
        <h1>Editar Carro</h1>
        <hr />
        <%
          String pplaca = request.getParameter("placa");
          Carro c = new Carro();
          if (pplaca != null){
              c = c.consultarCarro(pplaca);
          }    
        %>
        <form action="recebeeditacarro.jsp" method="POST">
            <label>Placa</label>
            <input type="text" name="placa" 
                   value="<%out.write(c.getPlaca());%>" />
            <br />
            <label>Marca</label>
            <input type="text" name="marca" 
                   value="<%out.write(c.getMarca());%>" />
            <br />
            <label>Modelo</label>
            <input type="text" name="modelo" 
                   value="<%out.write(c.getModelo());%>" />
            
            <br />
            <label>KM</label>
            <input type="text" name="km" 
                   value="<%out.write(""+c.getKm());%>" />
            <br />
            <input type="checkbox" 
                   name="arcondicionado" 
                   checked=<%
                   if (c.isArcondicionado()){
                       out.write("True");
                   }else{
                       out.write("False");
                   }
                   %>
                   >Ar condicionado?  </input> 
            <br />
            <input type="checkbox" 
                   name="direcaohidraulica" 
                   checked="<%
                    if (c.isArcondicionado()){
                       out.write("True");
                   }else{
                       out.write("False");
                   }
                   %>"
                     >Direção hidráulica? </input> 
            <hr />
            <input type="submit" value="Alterar" />
        </form>
    </body>
</html>
