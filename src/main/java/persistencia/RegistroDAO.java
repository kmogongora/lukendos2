package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import logica.Usuario;


/**
 * Contiene todas las operaciones CRUD requeridas para los datos de los juguetes
 * @author Cielo Juliana
 */
public class RegistroDAO {

    //Metodo que devolvera un ArrayList con los datos de los usuarios
    public ArrayList<Usuario> consultarUsuario(){
        ArrayList<Usuario> lista = new ArrayList<>(); //Instanciamos un objeto tipo ArrayList de la clase Usuario y sera vacio
        ConexionBD con = new ConexionBD(); //Instanciamos un objeto de la Clase ConexionBD
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, documento, nombre, apellido, fechaNacimiento, idGenero, email, nombreUsuario, claveAcceso, estado, idRol FROM usuarios "); //Ejecutamos el Query es decir la consulta con los datos que requerimos        
        //Implementar una estrutura TRY CATCH para controlar las excepciones
        try {
            while (rs.next()) { //Recorremos todas las filas de registros en cada una de sus columnas
                int id = rs.getInt("id");
                String documento = rs.getString("documento");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String fechaNacimiento = rs.getString("fechaNacimiento");
                int idGenero = rs.getInt("idGenero");
                String email = rs.getString("email");
                String nombreUsuario = rs.getString("nombreUsuario");
                String claveAcceso = rs.getString("claveAcceso");
                String estado = rs.getString("estado");
                int idRol = rs.getInt("idRol");
                Usuario user = new Usuario(id, documento, nombre, apellido, fechaNacimiento, idGenero, email, nombreUsuario, claveAcceso, estado, idRol); //Creamos un objeto de Usuario con las variables creadas que almacenaron los datos de la BD
                lista.add(user); //Agregamos cada registro del objeto a la lista
            }
            
        } catch (SQLException ex){
            return null;            
        }
        return lista; //Retornara la lista con los datos 
    }
    
        /**
     * Envía la sentencia SQL para almacenar el dato de un usuario
     * @param j un objeto de tipo Usuario
     * @return in número indicando el id generado por la base de datos
     */
    public int guardarNuevoUsuario(Usuario user) {
        ConexionBD con = new ConexionBD();
              
        String documento = user.getDocumento();
        String nombre = user.getNombre();
        String apellido = user.getApellido();
        String fechaNacimiento = user.getFechaNacimiento();
        int idGenero = user.getIdGenero();
        String email = user.getEmail();
        String nombreUsuario = user.getNombreUsuario();
        String claveAcceso = user.getClaveAcceso();
        String estado = user.getEstado();
        int idRol = user.getIdRol();
        
        String sql = "INSERT INTO usuarios(documento, nombre, apellido, fechaNacimiento, idGenero, email, nombreUsuario, claveAcceso, estado, idRol) VALUES ('"+documento+"', '"+nombre+"', '"+apellido+"', '"+fechaNacimiento+"', "+idGenero+", '"+email+"', '"+nombreUsuario+"', '"+claveAcceso+"', '"+estado+"', "+idRol+")";
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
    
    
    //Metodo para cargar los diferentes tipos de Género que existen en la BD
    public TreeMap<Integer, String> cargarGeneroUsuarios(){
        TreeMap<Integer, String> listaGeneros = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre FROM genero");
        
        try{
            while (rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                listaGeneros.put(id, nombre);
            }
            
        } catch (SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaGeneros;
    }
    
    
    //Metodo para cargar los diferentes tipos de Usuarios que existen en la BD
    public TreeMap<Integer, String> cargarTiposUsuarios(){
        TreeMap<Integer, String> listaTipos = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre FROM rol");
        
        try{
            while (rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                listaTipos.put(id, nombre);
            }
            
        } catch (SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaTipos;
    }
}
