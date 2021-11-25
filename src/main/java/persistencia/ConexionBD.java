package persistencia;
/**
 *
 * @author Carolina
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class ConexionBD {
    //Atributos
    private String conectorInstalado = "jdbc:mysql:"; //Conector o driver que se instalo para la conexion
    private String host = "localhost:8890"; //Puerto de conexion
    private String baseDatos = "cuentomislukas"; //Variable que almacena el nombre de la Base de datos para este caso se nombro "cuentomislukas"
    private String username = "root"; //Variable que almacena el nombre de usuario de acceso a la base de datos
    private String password = "root"; // Variable que almacena la clave de acceso en este caso se dejo vacio 
    public Connection conexion;//Variable de tipo Connection
    private Statement ejecutor; // Ejecutor de las sentencias SQL
    
    //Constructor de conexion, ejecuta automaticamente el metodo conectar
    public ConexionBD() {
        conectar();
    }
    
    //Determina si hay conexion activa a la base de datos
    public boolean isConectado() {
        return (this.conexion != null);
    }
      
    //Metodo para Conectar con la BD
    public void conectar()
    {
        //Implementar una estrutura TRY CATCH para controlar las excepciones
        try
        {
            String cadenaConexion = conectorInstalado + "//" + host + "/" + baseDatos; //Cadena de conexion
            Class.forName("com.mysql.cj.jdbc.Driver"); //Driver con el cual va a trabajar
            conexion = DriverManager.getConnection(cadenaConexion, username, password); //Crear conexion con: Cadena de conexion, usuario y contraseña de acceso a la BD
            ejecutor = conexion.createStatement();
            ejecutor.setQueryTimeout(30);  // Establece el tiempo de ejecucion maximo en 30s
            //System.out.println("conexión creada: "+conexion);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * Ejecuta una sentencia SQL de consulta
     * @param sql la consulta SQL que se arma para consultar registros
     * @return un resultset con los registros obtenidos por la consulta
     */
    public ResultSet ejecutarQuery(String sql){
        ResultSet rs = null;
        try
        {
            rs = ejecutor.executeQuery(sql);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return rs;
    }
    
    /**
     * Ejecuta una sentencia SQL de inserciÃ³n
     * @param sql la consulta SQL que se arma para insertar un registro
     * @return un resultset con el id del registro que se inserta
     */
    public ResultSet ejecutarInsert(String sql) {
        ResultSet rs = null;
        try
        {
            int cant = ejecutor.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            if (cant > 0) {
                rs = ejecutor.getGeneratedKeys();
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return rs;
    }
    
    /**
     * Ejecuta una sentencia SQL de modificacion
     * @param sql la consulta SQL que se arma para modificar un registro
     * @return la cantidad de registros que se han modificado
     */
    public int ejecutarUpdate(String sql) {
        int cant = 0;
        try
        {
            cant = ejecutor.executeUpdate(sql);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return cant;
    }
    
    /**
     * Cierra la conexiÃ³n a la base de datos. Debe usarse siempre luego de ejecutar 
     * una sentencia y obtener la informacion requerida
     */
    public void desconectar() {
        try {
            conexion.close();
            conexion = null;
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }
    
    public Connection getConexion(){
        return conexion;
    }
    
}
   