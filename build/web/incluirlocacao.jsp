<%@page import="modelos.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <script src="scripts/menu.js"></script>  
        <h1>Cadastro Locação</h1>
        <hr />
        <label class="cabecalho" id="msg"> 
            <%
                if(request.getParameter("pmensagem") != null)         
                    out.write(request.getParameter("pmensagem"));
            %>
        </label>
        
        <%
          Carro carro = new Carro();
          List<Carro> carros = carro.consultarGeral();
          
          Cliente cliente = new Cliente();
          List<Cliente> clientes = cliente.consultarGeral();

        %>  
        
        <form action="recebedadoslocacao.jsp" method="POST">
           <div>  
                <label>Escolha o Carro</label> <br/>
                 <select name="placa">
                     <% for(Carro ca: carros){ %>
                        <option value="<%out.write(""+ca.getPlaca());%>">
                            <% out.write(ca.getPlaca() + " - " + ca.getModelo()); %>
                        </option>
                     <%}%>
                 </select> 
                 <br />
                 <label>Escolha o Cliente</label> <br/>
                 <select name="cpfcliente">
                     <%for(Cliente c: clientes){%>
                         <option value="<%out.write(c.getCpf());%>">
                             <% out.write(c.getNome() + "-"+c.getCpf()); %>
                         </option>
                     <%}%>
                 </select>
                 <br />
                 <label>Informe a data da reserva</label> <br/>
                 <input type="date" name="datareserva" />
                 <br/>
                 
                 <label>Informe a data da locação</label> <br/>
                 <input type="date" name="datalocacao" />
                 <br/>
                 
                 <label>Informe a data da devolução</label> <br/>
                 <input type="date" name="datadevolucao" />
                 <br/>
                 
                 <input type="submit" value="Salvar" />  
            </div>     
        </form>        
    </body>
</html>
