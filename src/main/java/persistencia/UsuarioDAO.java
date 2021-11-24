package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Usuario;

/**
 *
 * @author Carolina Bernal
 */
public class UsuarioDAO implements Validar {

    ConexionBD con = new ConexionBD();
    PreparedStatement prestmt;
    ResultSet rs;
    int r=0;
    
    @Override
    public int validar(Usuario user) {
        String sql = "Select * FROM usuarios WHERE nombreUsuario=? AND claveAcceso=?"; 
        con.conectar();
        
        try{
            prestmt = con.conexion.prepareStatement(sql);
            prestmt.setString(1, user.getNombreUsuario());
            prestmt.setString(2, user.getClaveAcceso());
            rs = prestmt.executeQuery();
            while(rs.next()){
                
                r=r+1;
                
                user.setId(rs.getInt("id"));
                user.setDocumento(rs.getString("documento"));
                user.setNombre(rs.getString("nombre"));
                user.setApellido(rs.getString("apellido"));
                user.setFechaNacimiento(rs.getString("fechaNacimiento"));
                user.setIdGenero(rs.getInt("idGenero"));
                user.setEmail(rs.getString("email"));
                user.setNombreUsuario(rs.getString("nombreUsuario"));
                user.setClaveAcceso(rs.getString("claveAcceso"));
                user.setEstado(rs.getString("estado"));
                user.setIdRol(rs.getInt("idRol"));
            }   
            if (r==1) {
                return 1;
            }else{
                return 0;
            }
        }
        catch (SQLException ex){
            return 0;
        } 
         
    }
    
}