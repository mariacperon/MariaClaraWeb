package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Carro {
	private String  placa;
	private String  marca;
	private String  modelo;
	private int     km;
	private boolean arcondicionado;
	private boolean direcaohidraulica;


	public boolean incluirCarro() {
 // declarando comando de execucao do banco de dados
            String sql = "INSERT INTO carro ";
                  sql += "(placa, marca, modelo, km, arcondicionado, direcaohidraulica) ";
                  sql += " VALUES(?,?,?,?,?,?) ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.placa);
                stm.setString(2, this.marca);
                stm.setString(3, this.modelo);
                stm.setInt(4, this.km);
                stm.setBoolean(5, this.arcondicionado);
                stm.setBoolean(6, this.direcaohidraulica);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
	}

	public boolean alterarCarro() {
            // declarando comando de execucao do banco de dados
            String  sql = "UPDATE carro ";
                    sql += "SET marca  = ?, ";                   
                    sql += "    modelo = ?, "; 
                    sql += "    km     = ?, "; 
                    sql += "    arcondicionado    = ?, ";
                    sql += "    direcaohidraulica = ? ";
                    sql += "where placa = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.marca);
                stm.setString(2, this.modelo);
                stm.setInt(3, this.km);
                stm.setBoolean(4, this.arcondicionado);
                stm.setBoolean(5, this.direcaohidraulica);
                stm.setString(6, this.placa);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
	return true;
	}

	public boolean excluirCarro() {
            String sql  = "DELETE FROM carro ";
                   sql += "WHERE placa = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
	return true;	
	}

	public Carro consultarCarro(String pPlaca) {
         this.placa = pPlaca;
	 String sql  = "select placa,marca, modelo, km, ";
                sql += " arcondicionado, direcaohidraulica ";
                sql += " from carro";
                sql += " where placa = ? ";
            Connection con = Conexao.conectar();
            Carro carro = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.placa);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   carro = new Carro();
                   carro.setPlaca(rs.getString("placa"));
                   carro.setMarca(rs.getString("marca"));
                   carro.setModelo(rs.getString("modelo"));
                   carro.setKm(rs.getInt("km"));
                   carro.setDirecaohidraulica(rs.getBoolean("direcaohidraulica"));
                   carro.setArcondicionado(rs.getBoolean("arcondicionado"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return carro;	
	}
        
    public List<Carro> consultarGeral(){
        List<Carro> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from carro order by placa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Carro carro = new Carro();
               carro.setPlaca(rs.getString("placa"));
               carro.setMarca(rs.getString("marca"));
               carro.setModelo(rs.getString("modelo"));
               carro.setKm(rs.getInt("km"));
               carro.setArcondicionado(rs.getBoolean("arcondicionado"));
               carro.setDirecaohidraulica(rs.getBoolean("direcaohidraulica"));
               lista.add(carro);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
        
    // area de getters e setters

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getKm() {
        return km;
    }

    public void setKm(int km) {
        this.km = km;
    }

    public boolean isArcondicionado() {
        return arcondicionado;
    }

    public void setArcondicionado(boolean arcondicionado) {
        this.arcondicionado = arcondicionado;
    }

    public boolean isDirecaohidraulica() {
        return direcaohidraulica;
    }

    public void setDirecaohidraulica(boolean direcaohidraulica) {
        this.direcaohidraulica = direcaohidraulica;
    }
}