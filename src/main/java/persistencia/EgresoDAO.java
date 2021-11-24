
package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import logica.Egreso;

/**
 *
 * @author Andres
 */
public class EgresoDAO {
    
    //Metodo que devolvera un ArrayList con los datos de los Egresos registrados
    public ArrayList<Egreso> consultarEgresos(){
        ArrayList<Egreso> listaEgresos = new ArrayList<>(); 
        ConexionBD con = new ConexionBD(); 
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario FROM egreso"); 
       
        try {
            while (rs.next()) { 
                int id = rs.getInt("id");
                String tipoEgreso = rs.getString("tipoEgreso");
                int idCategoriaEgreso = rs.getInt("idCategoriaEgreso");
                String fechaEgreso = rs.getString("fechaEgreso");
                double valorEgreso = rs.getDouble("valorEgreso");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                Egreso spend = new Egreso(id, tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario);
                listaEgresos.add(spend);
            }
            
        } catch (SQLException ex){
            return null;            
        }
        return listaEgresos;  
    }    
    
    /**
     * Envía la sentencia SQL para obtener la información de 1 egreso en específico y estructura
     * la respuesta en un objeto de tipo Egreso
     * @param idAConsultar el id del egreso para consultar
     * @return un objeto de tipo Egreso con la información cargada o null
     */
    public Egreso consultarEgresoId(int idAConsultar) {
        Egreso spend = null;
        ConexionBD con = new ConexionBD();
        con.conectar();
        String sql = "SELECT id, tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario " +
                     "FROM egreso "+
                     "WHERE id = "+idAConsultar + " ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            if (rs.next()) {
                int id = rs.getInt("id");
                String tipoEgreso = rs.getString("tipoEgreso");
                int idCategoriaEgreso = rs.getInt("idCategoriaEgreso");
                String fechaEgreso = rs.getString("fechaEgreso");
                double valorEgreso = rs.getDouble("valorEgreso");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                spend = new Egreso(id, tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario);
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
     * @param spend un objeto de tipo Egreso
     * @return in número indicando el id generado por la base de datos
     */
    public int guardarNuevoEgreso(Egreso spend) {
        ConexionBD con = new ConexionBD();
              
        String tipoEgreso = spend.getTipoEgreso();
        int idCategoriaEgreso = spend.getIdCategoriaEgreso();
        String fechaEgreso = spend.getFechaEgreso();
        double valorEgreso = spend.getValorEgreso();
        String descripcion = spend.getDescripcion();
        int idUsuario = spend.getIdUsuario();
        
        String sql = "INSERT INTO egreso(tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario) VALUES ('"+tipoEgreso+"', "+idCategoriaEgreso+", '"+fechaEgreso+"', "+valorEgreso+", '"+descripcion+"', "+idUsuario+")";
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
     * Envía la sentencia SQL para actualizar el dato de un Egreso existente
     * @param spend un objeto de tipo Egreso
     * @return un número indicando la cantidad de registros afectados
     */
    public int guardarEgresoExistente(Egreso spend) {
        ConexionBD con = new ConexionBD();
        con.conectar();
        
        int id = spend.getId();
        String tipoEgreso = spend.getTipoEgreso();
        int idCategoriaEgreso = spend.getIdCategoriaEgreso();
        String fechaEgreso = spend.getFechaEgreso();
        double valorEgreso = spend.getValorEgreso();
        String descripcion = spend.getDescripcion();
        int idUsuario = spend.getIdUsuario();
        
        String sql = "UPDATE egreso SET tipoEgreso = '" + tipoEgreso + "' , idCategoriaEgreso = " + idCategoriaEgreso + " , fechaEgreso = '" + fechaEgreso + "', valorEgreso = " + valorEgreso + ", descripcion = '" + descripcion + "', idUsuario = "+ idUsuario +" WHERE id = " + id + " ";
        int filas = con.ejecutarUpdate(sql);
        con.desconectar();
        return filas;
    }

    //Metodo para cargar los diferentes tipos de Género que existen en la BD
    public TreeMap<Integer, String> cargarCategoriaEgresos(){
        TreeMap<Integer, String> listaCategoriaEgresos = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre FROM categoria_egresos");
        
        try{
            while (rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                listaCategoriaEgresos.put(id, nombre);
            }
            
        } catch (SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaCategoriaEgresos;
    }
    
    /*Metodo que permite eliminar un registro de Egreso directamente en la 
     * BD según el Id seleccionado*/
    public int eliminarEgreso(int id) {
        ConexionBD con= new ConexionBD();
        con.conectar();
        String sql="DELETE FROM egreso WHERE id="+id;
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
    public double sumaGastoTotal(int idAConsultar) {
        idAConsultar = 1;
        ConexionBD con = new ConexionBD();
        String sql = "SELECT SUM(valorEgreso) GastoTotal " +
                     "FROM cuentomislukas.egreso "+
                     "WHERE idUsuario = "+ idAConsultar;
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            if (rs.next()) {
                double gastoTotal = rs.getDouble("GastoTotal");
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
     * la respuesta en una lista de tipo Egreso
     * @param filtro el filtro para buscar datos en la lista de juguetes para consultar
     * @return un arraylist de tipo Juguete con la información cargada
     */
     public ArrayList<Egreso> consultarEgresosPorFiltro(String filtroFechaDesde, String filtroFechaHasta) {
        ArrayList<Egreso> listadoEgresos = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        String sql = "SELECT E.id, E.tipoEgreso, C.nombre, E.fechaEgreso, E.descripcion, E.valorEgreso " +
                     "FROM egreso E " +
                     "JOIN categoria_egresos C ON (C.id = E.id) " +
                     "WHERE E.fechaEgreso BETWEEN '" + filtroFechaDesde + "' " +
                     "AND '" + filtroFechaHasta + "' ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            while (rs.next()) { 
                int id = rs.getInt("id");
                String tipoEgreso = rs.getString("tipoEgreso");
                int idCategoriaEgreso = rs.getInt("idCategoriaEgreso");
                String fechaEgreso = rs.getString("fechaEgreso");
                double valorEgreso = rs.getDouble("valorEgreso");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                Egreso spend = new Egreso(id, tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario);
                listadoEgresos.add(spend);               
                
            }
        } catch (SQLException ex) {
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listadoEgresos;
    }

}
