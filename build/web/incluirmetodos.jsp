<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluir Métodos</title>
    </head>
    <body>
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <label class="cabecalho" id="msg"> 
                <%
                    if(request.getParameter("pmensagem") != null)         
                    out.write(request.getParameter("pmensagem"));
                %>
            </label>
            <article>
                <h1>Incluir Métodos de Pagamento</h1>
                <form action="recebedadosmetodos.jsp" method="POST">
                    <div>
                        <label>Cpf</label>
                        <input name="cpf" type="text" required="required" 
                               pattern="[0-9]*" title="Digite apenas números" placeholder="Informe o CPF" /> <br/>

                        <label>TipoPagamento</label>
                        <input type="text" name="tipopagto" /> <br />

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

            var tipopagto = document.getElementsByName("tipopagto");
            if(tipopagto[0].value === ""){
                tipopagto[0].focus();
                alert("Informe o tipo do pagamento");
                exit();
            }
            document.forms[0].submit();
    }     
</script>
</html>
