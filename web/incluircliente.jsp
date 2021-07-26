<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
                <h1>Cadastro de Clientes</h1>
                <hr /> 
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <form action="recebedadoscliente.jsp" method="POST">
                    <div>
                        <label>Cpf</label>
                        <input id="cpf" name="cpf" type="text" required="required" 
                               pattern="[0-9]*" title="Digite apenas números" placeholder="Informe o CPF" /> <br/>
                        <br />
                        <label>Nome</label>
                        <input type="text" name="nome" placeholder="Informe o NOME" /> <br />
                        <br />
                        <label>Email</label>
                        <input type="text" name="email" placeholder="Informe o EMAIL" /> <br />
                        <br />
                        <label>Cartão</label>
                        <input type="text" name="cartao" placeholder="Informe o CARTÃO" /> <br />
                        <br />
                        <input type="button" value="Salvar" onclick="enviarDados()" />
                    </div>   
                </form>
            </article>
        </section>                
<script>
    function enviarDados(){
            var cpf = document.getElementsByName("cpf");
            if(cpf[0].value === ""){
                cpf[0].focus();
                alert("Informe o cpf");
                exit();
            }

            var nome = document.getElementsByName("nome");
            if(nome[0].value === ""){
                nome[0].focus();
                alert("Informe o nome");
                exit();
            }

            var email = document.getElementsByName("email");
            if(email[0].value === ""){
                email[0].focus();
                alert("Informe o email");
                exit();
            }

            var cartao = document.getElementsByName("cartao");
            if(cartao[0].value === ""){
                cartao[0].focus();
                alert("Informe o Cartão");
                exit();
            }
            if(cartao[0].length > 10){
                cartao[0].focus();
                alert("O cartão está muito grande");
                exit();
            }
            document.forms[0].submit();
    }        
    function enviaForm(){
        document.forms[0].submit();
        response.sendRedirect("nulo.html");
    }        
</script>    
    </body>
</html>