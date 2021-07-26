package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Locacao {

	private int    id;
	private Date   datareserva;
	private Date   datalocacao;
	private Date   datadevolucao;
	private String placa;
	private String cpfCliente;

        @Override
        public String toString() {
            return "Locacao{" + "id=" + id + ", datareserva=" + datareserva + ", datalocacao=" + datalocacao + ", datadevolucao=" + datadevolucao + ", placa=" + placa + ", cpfCliente=" + cpfCliente + '}';
        }

	public boolean incluirLocacao() {
	 String sql="insert into locacao (datareserva, datalocacao, datadevolucao,";
               sql+= "placa, cpfcliente) ";
               sql+="values(?,?,?,?,?)";
        Connection  con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setDate(1, this.datareserva);
            stm.setDate(2, this.datalocacao);
            stm.setDate(3, this.datadevolucao);
            stm.setString(4, this.placa);
            stm.setString(5, this.cpfCliente);
            stm.execute();
            
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
          return false;
        }
        return true;	
	}

	public boolean alterarLocacao() {
	 Connection con = Conexao.conectar();
        String  sql = "update locacao set ";
                sql+= "cpfcliente    = ?, ";
                sql+= "datalocacao   = ?, ";
                sql+= "datareserva   = ?, ";
                sql+= "datadevolucao = ?  ";
                sql+= "where placa = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpfCliente);
            stm.setDate(2, this.datalocacao);
            stm.setDate(3, this.datareserva);
            stm.setDate(4, this.datadevolucao);
            stm.setString(5, this.placa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;	
	}

	public boolean excluirLocacao() {
	String sql  = "DELETE FROM locacao ";
               sql += "WHERE cpfcliente = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpfCliente);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

	public Locacao consultarLocacao(int iid) {
            this.id = iid;
            String  sql  = "select cpf, datareserva, datalocacao,datadevolucao,placa, cpfcliente ";
                    sql += "from locacao ";
                    sql += "where id = ?";
            Connection con = Conexao.conectar();
            Locacao locacao = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.id);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    locacao = new Locacao();
                    locacao.setPlaca(placa);
                    locacao.setCpfCliente(cpfCliente);
                    locacao.setDatalocacao((datalocacao));
                    locacao.setDatadevolucao((datadevolucao));
                    locacao.setDataReserva((datareserva));
                } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return locacao;
	}
        
    public List<Cliente> consultarGeral(){
        List<Cliente> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from cliente order by cpf";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Cliente  cliente = new Cliente();
               cliente.setCpf(rs.getString("cpf"));
               cliente.setNome(rs.getString("nome"));
               cliente.setEmail(rs.getString("email"));
               cliente.setNrCartao(rs.getInt("nrcartao"));
               lista.add(cliente);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
        
	public void locarCarro() {
		// TODO implement here
	}

	public void devolverCarro() {
		// TODO implement here
	}
        
        

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }
   
    public Date getDataReserva() {
        return datareserva;
    }

    public void setDataReserva(Date data) {
        this.datareserva = data;
    }

    public Date getDatalocacao() {
        return datalocacao;
    }

    public void setDatalocacao(Date datalocacao) {
        this.datalocacao = datalocacao;
    }

    public Date getDatadevolucao() {
        return datadevolucao;
    }

    public void setDatadevolucao(Date datadevolucao) {
        this.datadevolucao = datadevolucao;
    }

     public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}