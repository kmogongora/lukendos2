
package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import logica.Metas;

/**
 *
 * @author Carolina Bernal
 */
public class MetasDAO {
    
    //Metodo que devolvera un ArrayList con los datos registrados en la tabla de Metas
    public ArrayList<Metas> consultarMetas(){
        ArrayList<Metas> listaMetas = new ArrayList<>(); 
        ConexionBD con = new ConexionBD(); 
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre, valorTotal, valorParcial, fechaObjetiva, idUsuario FROM metas"); 
       
        try {
            while (rs.next()) { 
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                double valorTotal = rs.getDouble("valorTotal");
                double valorParcial = rs.getDouble("valorParcial");
                String fechaObjetiva = rs.getString("fechaObjetiva");
                int idUsuario = rs.getInt("idUsuario");
                
                Metas objetivo = new Metas(id, nombre, valorTotal, valorParcial, fechaObjetiva, idUsuario);
                listaMetas.add(objetivo);
            }
            
        } catch (SQLException ex){
            return null;            
        }
        return listaMetas;  
    }    
    
    /**
     * Envía la sentencia SQL para obtener la información de 1 Meta en específico y estructura
     * la respuesta en un objeto de tipo Metas
     * @param idAConsultar el id de la Meta para consultar
     * @return un objeto de tipo Metas con la información cargada o null
     */
    public Metas consultarMetaId(int idAConsultar) {
        Metas objetivo = null;
        ConexionBD con = new ConexionBD();
        con.conectar();
        String sql = "SELECT id, nombre, valorTotal, valorParcial, fechaObjetiva, idUsuario " +
                     "FROM metas "+
                     "WHERE id = "+idAConsultar + " ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            if (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                double valorTotal = rs.getDouble("valorTotal");
                double valorParcial = rs.getDouble("valorParcial");
                String fechaObjetiva = rs.getString("fechaObjetiva");
                int idUsuario = rs.getInt("idUsuario");
                
                objetivo = new Metas(id, nombre, valorTotal, valorParcial, fechaObjetiva, idUsuario);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return objetivo;
        }
        con.desconectar();
        return objetivo;
    }
    
    /**
     * Envía la sentencia SQL para almacenar el dato de una meta
     * @param objetivo un objeto de tipo Metas
     * @return un número indicando el id generado por la base de datos
     */
    public int guardarNuevaMeta(Metas objetivo) {
        ConexionBD con = new ConexionBD();
        
        String nombre = objetivo.getNombre();
        double valorTotal = objetivo.getValorTotal();
        double valorParcial = objetivo.getValorParcial();
        String fechaObjetiva = objetivo.getFechaObjetiva();
        int idUsuario = objetivo.getIdUsuario();
        
        
        String sql = "INSERT INTO metas(nombre, valorTotal, valorParcial, fechaObjetiva, idUsuario) VALUES ('"+nombre+"', "+valorTotal+", "+valorParcial+", '"+fechaObjetiva+"', "+idUsuario+")";
        con.conectar();
        ResultSet rs = con.ejecutarInsert(sql);
        int id = 0;
        try {
            if (rs.next()){
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return 0; 
        }
        con.desconectar();
        return id;
    }
    
    /**
     * Envía la sentencia SQL para actualizar el dato de una Meta existente
     * @param objetivo es un objeto de tipo Metas
     * @return un número indicando la cantidad de registros afectados
     */
    public int guardarMetaExistente(Metas objetivo) {
        ConexionBD con = new ConexionBD();
        con.conectar();
        
        int id = objetivo.getId();
        String nombre = objetivo.getNombre();
        double valorTotal = objetivo.getValorTotal();
        double valorParcial = objetivo.getValorParcial();
        String fechaObjetiva = objetivo.getFechaObjetiva();
        int idUsuario = objetivo.getIdUsuario();
        
        String sql = "UPDATE metas SET nombre = '" + nombre + "', valorTotal = " + valorTotal + ", valorParcial = " + valorParcial + ", fechaObjetiva = '" + fechaObjetiva + "', idUsuario = "+ idUsuario +" WHERE id = " + id + " ";
        int filas = con.ejecutarUpdate(sql);
        con.desconectar();
        return filas;
    }

        
    /*Metodo que permite eliminar un registro de Metas directamente en la 
     * BD según el Id seleccionado*/
    public int eliminarMeta(int id) {
        ConexionBD con= new ConexionBD();
        con.conectar();
        String sql="DELETE FROM metas WHERE id="+id;
        int cant = 0 ;
        try {
            cant = con.ejecutarUpdate(sql);
        } catch (Exception e) {
          con.desconectar();
        }
        return cant;
    }
    
    
}

