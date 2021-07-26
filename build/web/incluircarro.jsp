<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <body>        
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
               <h1>Cadastro carro</h1>
                <hr />  
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <form action="recebedadoscarro.jsp" method="POST">
                    <div>
                        <label>Placa</label>
                        <input type="text" name="placa" placeholder="Informe a PLACA" />
                        <br />

                        <br />
                        <label>Marca</label>
                        <input type="text" name="marca" placeholder="Informe a MARCA" />
                        <br />

                        <br />
                        <label>Modelo</label>
                        <input type="text" name="modelo" placeholder="Informe o MODELO" />
                        <br />

                        <br />
                        <label>Quilometragem</label>
                        <input type="text" name="km" placeholder="Informe o KM" />
                        <br />

                        <br />
                        <input type="checkbox" name="arcondicionado">
                        Ar condicionado?</input>
                        <br />

                        <br />
                        <input type="checkbox" name="direcaohidraulica">
                         Direção hidráulica?</input>
                         <br />

                        <hr />
                        <input type="button" value="Salvar" onclick="enviaForm()"/>
                        <input type="reset" value="Cancelar" />
                    </div>
                </form>         
            </article>
        </section>            
        
        <script>
            function enviaForm(){
                var placa = document.getElementsByName("placa");
                if(placa[0].value === ""){
                    placa[0].focus();
                    alert("Informe a placa");
                    exit();
                }
                
                var marca = document.getElementsByName("marca");
                if(marca[0].value === ""){
                    marca[0].focus();
                    alert("Informe a marca");
                    exit();
                }
                
                var modelo = document.getElementsByName("modelo");
                if(modelo[0].value === ""){
                    modelo[0].focus();
                    alert("Informe a modelo");
                    exit();
                }
                var km = document.getElementsByName("km");
                if(km[0].value === ""){
                    km[0].focus();
                    alert("Informe a km");
                    exit();
                } 
                document.forms[0].submit();                
            }
        </script>    
    </body>   
</html>
