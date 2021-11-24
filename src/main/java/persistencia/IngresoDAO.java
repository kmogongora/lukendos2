
package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import logica.Ingreso;

/**
 *
 * @author Andres
 */
public class IngresoDAO {
    
    //Metodo que devolvera un ArrayList con los datos de los Ingresos registrados
    public ArrayList<Ingreso> consultarIngresos(){
        ArrayList<Ingreso> listaIngresos = new ArrayList<>(); 
        ConexionBD con = new ConexionBD(); 
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario FROM ingreso"); 
       
        try {
            while (rs.next()) { 
                int id = rs.getInt("id");
                String tipoIngreso = rs.getString("tipoIngreso");
                int idCategoriaIngreso = rs.getInt("idCategoriaIngreso");
                String fechaIngreso = rs.getString("fechaIngreso");
                double valorIngreso = rs.getDouble("valorIngreso");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                Ingreso spend = new Ingreso(id, tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario);
                listaIngresos.add(spend);
            }
            
        } catch (SQLException ex){
            return null;            
        }
        return listaIngresos;  
    }    
    
    /**
     * Envía la sentencia SQL para obtener la información de 1 ingreso en específico y estructura
     * la respuesta en un objeto de tipo Ingreso
     * @param idAConsultar el id del ingreso para consultar
     * @return un objeto de tipo Ingreso con la información cargada o null
     */
    public Ingreso consultarIngresoId(int idAConsultar) {
        Ingreso spend = null;
        ConexionBD con = new ConexionBD();
        con.conectar();
        String sql = "SELECT id, tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario " +
                     "FROM ingreso "+
                     "WHERE id = "+idAConsultar + " ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            if (rs.next()) {
                int id = rs.getInt("id");
                String tipoIngreso = rs.getString("tipoIngreso");
                int idCategoriaIngreso = rs.getInt("idCategoriaIngreso");
                String fechaIngreso = rs.getString("fechaIngreso");
                double valorIngreso = rs.getDouble("valorIngreso");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                spend = new Ingreso(id, tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return spend;
        }
        con.desconectar();
        return spend;
    }
    
    /**
     * Envía la sentencia SQL para almacenar el dato de un ingreso
     * @param spend un objeto de tipo Ingreso
     * @return in número indicando el id generado por la base de datos
     */
    public int guardarNuevoIngreso(Ingreso spend) {
        ConexionBD con = new ConexionBD();
              
        String tipoIngreso = spend.getTipoIngreso();
        int idCategoriaIngreso = spend.getIdCategoriaIngreso();
        String fechaIngreso = spend.getFechaIngreso();
        double valorIngreso = spend.getValorIngreso();
        String descripcion = spend.getDescripcion();
        int idUsuario = spend.getIdUsuario();
        
        String sql = "INSERT INTO ingreso(tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario) VALUES ('"+tipoIngreso+"', "+idCategoriaIngreso+", '"+fechaIngreso+"', "+valorIngreso+", '"+descripcion+"', "+idUsuario+")";
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
     * Envía la sentencia SQL para actualizar el dato de un Ingreso existente
     * @param spend un objeto de tipo Ingreso
     * @return un número indicando la cantidad de registros afectados
     */
    public int guardarIngresoExistente(Ingreso spend) {
        ConexionBD con = new ConexionBD();
        con.conectar();
        
        int id = spend.getId();
        String tipoIngreso = spend.getTipoIngreso();
        int idCategoriaIngreso = spend.getIdCategoriaIngreso();
        String fechaIngreso = spend.getFechaIngreso();
        double valorIngreso = spend.getValorIngreso();
        String descripcion = spend.getDescripcion();
        int idUsuario = spend.getIdUsuario();
        
        String sql = "UPDATE ingreso SET tipoIngreso = '" + tipoIngreso + "' , idCategoriaIngreso = " + idCategoriaIngreso + " , fechaIngreso = '" + fechaIngreso + "', valorIngreso = " + valorIngreso + ", descripcion = '" + descripcion + "', idUsuario = "+ idUsuario +" WHERE id = " + id + " ";
        int filas = con.ejecutarUpdate(sql);
        con.desconectar();
        return filas;
    }

    //Metodo para cargar los diferentes tipos de Género que existen en la BD
    public TreeMap<Integer, String> cargarCategoriaIngresos(){
        TreeMap<Integer, String> listaCategoriaIngresos = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre FROM categoria_ingresos");
        
        try{
            while (rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                listaCategoriaIngresos.put(id, nombre);
            }
            
        } catch (SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaCategoriaIngresos;
    }
    
    /*Metodo que permite eliminar un registro de Ingreso directamente en la 
     * BD según el Id seleccionado*/
    public int eliminarIngreso(int id) {
        ConexionBD con= new ConexionBD();
        con.conectar();
        String sql="DELETE FROM ingreso WHERE id="+id;
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
    public double sumaIngresoTotal(int idAConsultar) {
        idAConsultar = 1;
        ConexionBD con = new ConexionBD();
        String sql = "SELECT SUM(valorIngreso) GastoTotal " +
                     "FROM cuentomislukas.ingreso "+
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
     * la respuesta en una lista de tipo Ingreso
     * @param filtro el filtro para buscar datos en la lista de juguetes para consultar
     * @return un arraylist de tipo Juguete con la información cargada
     */
     public ArrayList<Ingreso> consultarIngresosPorFiltro(String filtroFechaDesde, String filtroFechaHasta) {
        ArrayList<Ingreso> listadoIngresos = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        String sql = "SELECT E.id, E.tipoIngreso, C.nombre, E.fechaIngreso, E.descripcion, E.valorIngreso " +
                     "FROM ingreso E " +
                     "JOIN categoria_ingresos C ON (C.id = E.id) " +
                     "WHERE E.fechaIngreso BETWEEN '" + filtroFechaDesde + "' " +
                     "AND '" + filtroFechaHasta + "' ";
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            while (rs.next()) { 
                int id = rs.getInt("id");
                String tipoIngreso = rs.getString("tipoIngreso");
                int idCategoriaIngreso = rs.getInt("idCategoriaIngreso");
                String fechaIngreso = rs.getString("fechaIngreso");
                double valorIngreso = rs.getDouble("valorIngreso");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                Ingreso spend = new Ingreso(id, tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario);
                listadoIngresos.add(spend);               
                
            }
        } catch (SQLException ex) {
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listadoIngresos;
    }

}
