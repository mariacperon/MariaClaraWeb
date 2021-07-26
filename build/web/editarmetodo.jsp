<%@page import="modelos.MetodosPagto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
                <body>
                    <h1>Editar Método</h1>
                    <hr />
                    <%
                      String idcpf = request.getParameter("cpf");
                      MetodosPagto m = new MetodosPagto();
                      if (idcpf != null){
                          m = m.consultarMetodo(idcpf);
                      }    
                    %>
                    <form action="recebeeditametodo.jsp" method="POST">
                        <label>CPF</label>
                        <input type="text" name="cpf" 
                               readonly="true"  
                               value="<%out.write(m.getCpf());%>" />
                        <br />
                        <label>Tipo Pagamento</label>
                        <input type="text" name="tipopagto" 
                               value="<%out.write(m.getTipoPagto());%>" />
                        <br />
                        <hr />
                        <input type="submit" value="Alterar" />
                    </form>
                </body>
            </article>
        </section>          
</html>
