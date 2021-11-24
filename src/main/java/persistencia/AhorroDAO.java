
package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import logica.Ahorro;

/**
 *
 * @author Andres
 */
public class AhorroDAO {
    
    //Metodo que devolvera un ArrayList con los datos de los Ahorros registrados
    public ArrayList<Ahorro> consultarAhorros(){
        ArrayList<Ahorro> listaAhorros = new ArrayList<>(); 
        ConexionBD con = new ConexionBD(); 
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, fechaAhorro, valorAhorro, descripcion, idUsuario FROM ahorro"); 
       
        try {
            while (rs.next()) { 
                int id = rs.getInt("id");
                String fechaAhorro = rs.getString("fechaAhorro");
                double valorAhorro = rs.getDouble("valorAhorro");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                Ahorro spend = new Ahorro(id, fechaAhorro, valorAhorro, descripcion, idUsuario);
                listaAhorros.add(spend);
            }
            
        } catch (SQLException ex){
            return null;            
        }
        return listaAhorros;  
    }    
    
    /**
     * Envía la sentencia SQL para obtener la información de 1 egreso en específico y estructura
     * la respuesta en un objeto de tipo Ahorro
     * @param idAConsultar el id del egreso para consultar
     * @return un objeto de tipo Ahorro con la información cargada o null
     */
    public Ahorro consultarAhorroId(int idAConsultar) {
        Ahorro spend = null;
        ConexionBD con = new ConexionBD();
        con.conectar();
        String sql = "SELECT id, fechaAhorro, valorAhorro, descripcion, idUsuario " +
                     "FROM ahorro "+
                     "WHERE id = "+idAConsultar + " ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            if (rs.next()) {
                int id = rs.getInt("id");
                String fechaAhorro = rs.getString("fechaAhorro");
                double valorAhorro = rs.getDouble("valorAhorro");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                spend = new Ahorro(id, fechaAhorro, valorAhorro, descripcion, idUsuario);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return spend;
        }
        con.desconectar();
        return spend;
    }
    
    /**
     * Envía la sentencia SQL para almacenar el dato de un egreso
     * @param spend un objeto de tipo Ahorro
     * @return in número indicando el id generado por la base de datos
     */
    public int guardarNuevoAhorro(Ahorro spend) {
        ConexionBD con = new ConexionBD();
              
        String fechaAhorro = spend.getFechaAhorro();
        double valorAhorro = spend.getValorAhorro();
        String descripcion = spend.getDescripcion();
        int idUsuario = spend.getIdUsuario();
        
        String sql = "INSERT INTO ahorro(fechaAhorro, valorAhorro, descripcion, idUsuario) VALUES ('"+fechaAhorro+"', "+valorAhorro+", '"+descripcion+"', "+idUsuario+")";
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
     * Envía la sentencia SQL para actualizar el dato de un Ahorro existente
     * @param spend un objeto de tipo Ahorro
     * @return un número indicando la cantidad de registros afectados
     */
    public int guardarAhorroExistente(Ahorro spend) {
        ConexionBD con = new ConexionBD();
        con.conectar();
        
        int id = spend.getId();
        String fechaAhorro = spend.getFechaAhorro();
        double valorAhorro = spend.getValorAhorro();
        String descripcion = spend.getDescripcion();
        int idUsuario = spend.getIdUsuario();
        
        String sql = "UPDATE ahorro SET fechaAhorro = '" + fechaAhorro + "', valorAhorro = " + valorAhorro + ", descripcion = '" + descripcion + "', idUsuario = "+ idUsuario +" WHERE id = " + id + " ";
        int filas = con.ejecutarUpdate(sql);
        con.desconectar();
        return filas;
    }

  
    
    /*Metodo que permite eliminar un registro de Ahorro directamente en la 
     * BD según el Id seleccionado*/
    public int eliminarAhorro(int id) {
        ConexionBD con= new ConexionBD();
        con.conectar();
        String sql="DELETE FROM ahorro WHERE id="+id;
        int cant = 0 ;
        try {
            cant = con.ejecutarUpdate(sql);
        } catch (Exception e) {
          con.desconectar();
        }
        return cant;
    }
    
     /**
     * Envía la sentencia SQL para obtener la información del gasto total del usuario específico y estructura
     * la respuesta en un double
     * @param idAConsultar el id del usuario para consultar
     * @return un double con el gasto total información cargada o null
     */
    public double sumaAhorroTotal(int idAConsultar) {
        idAConsultar = 1;
        ConexionBD con = new ConexionBD();
        String sql = "SELECT SUM(valorAhorro) ahorroTotal " +
                     "FROM cuentomislukas.ahorro "+
                     "WHERE idUsuario = "+ idAConsultar;
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            if (rs.next()) {
                double ahorroTotal = rs.getDouble("ahorroTotal");
            }
        } catch (SQLException ex) {
            con.desconectar();
            return 0;
        }
        con.desconectar();
        return 0;
    }

        /**
     * Envía la sentencia SQL para obtener la información de ciertos gastos mediante filtro y estructura
     * la respuesta en una lista de tipo Ahorro
     * @param filtro el filtro para buscar datos en la lista de juguetes para consultar
     * @return un arraylist de tipo Juguete con la información cargada
     */
     public ArrayList<Ahorro> consultarAhorrosPorFiltro(String filtroFechaDesde, String filtroFechaHasta) {
        ArrayList<Ahorro> listadoAhorros = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        String sql = "SELECT E.id, C.nombre, E.fechaAhorro, E.descripcion, E.valorAhorro " +
                     "FROM ahorro E " +
                     "WHERE E.fechaAhorro BETWEEN '" + filtroFechaDesde + "' " +
                     "AND '" + filtroFechaHasta + "' ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            while (rs.next()) { 
                int id = rs.getInt("id");
                String fechaAhorro = rs.getString("fechaAhorro");
                double valorAhorro = rs.getDouble("valorAhorro");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                Ahorro spend = new Ahorro(id, fechaAhorro, valorAhorro, descripcion, idUsuario);
                listadoAhorros.add(spend);               
                
            }
        } catch (SQLException ex) {
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listadoAhorros;
    }

}
