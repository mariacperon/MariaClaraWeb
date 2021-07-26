package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class MetodosPagto {
    private String cpf;
    private String tipoPagto;

    public boolean incluirMetodos() {
        // declarando comando de execucao do banco de dados
        String sql  = "INSERT INTO metodospagto " +
                      "(cpf, tipopagto) " +
                      "VALUES(?, ?)";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            stm.setString(2, this.tipoPagto);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }            
        return true;   
    }
    
    public MetodosPagto consultarMetodo(String pCpf) {
            this.cpf = pCpf;
            String  sql  = "select *";
                    sql += "from metodospagto ";
                    sql += "where cpf = ?";
            Connection con = Conexao.conectar();
            MetodosPagto metodo = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.cpf);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   metodo = new MetodosPagto();
                   metodo.setCpf(rs.getString("cpf"));
                   metodo.setTipoPagto(rs.getString("tipopagto"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return metodo;
	}
        
    public List<MetodosPagto> consultarGeral(){
        List<MetodosPagto> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "SELECT * FROM metodospagto order by cpf";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               MetodosPagto metodo = new MetodosPagto();
               metodo.setCpf(rs.getString("cpf"));
               metodo.setTipoPagto(rs.getString("tipopagto"));
               lista.add(metodo);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    
    public boolean excluirMetodo() {
	String sql  = "DELETE FROM metodospagto ";
               sql += "WHERE cpf = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
    }
    
    public boolean alterarMetodo() {
	// declarando comando de execucao do banco de dados
            String sql  = "UPDATE metodospagto ";
                   sql += "set tipopagto     = ? ";
                   sql += "where cpf = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.tipoPagto);
                stm.setString(2, this.cpf);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTipoPagto() {
        return tipoPagto;
    }

    public void setTipoPagto(String tipoPagto) {
        this.tipoPagto = tipoPagto;
    }


}

