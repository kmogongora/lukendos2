
package logica;

import java.util.ArrayList;
import persistencia.MetasDAO;

/**
 *
 * @author Carolina Bernal
 */
public class ColeccionMetas {
    //Atributos
    private ArrayList<Metas> listadoMetas;
    
    
    public ArrayList<Metas> getLista(){
        return listadoMetas;
    }
    
    
    public boolean cargarMetas(){
        MetasDAO dao = new MetasDAO();
        listadoMetas = dao.consultarMetas();
        
        if (listadoMetas.size() > 0) {
            return true;
        } 
        else {
           return false; 
        }
    }
    
    /**
     * Carga la información de una sola Meta de la base de datos
     * @return true si carga las Metas, o false si no se logró cargar
     */
    public Metas cargarUnaMeta(int id) {
        MetasDAO dao = new MetasDAO();
        Metas objetivo = dao.consultarMetaId(id);
        return objetivo;
    }
    

    public boolean guardarNuevaMeta (Metas objetivo) {
        MetasDAO dao = new MetasDAO();
        
        if (objetivo.getId() == 0) {
            int id = dao.guardarNuevaMeta(objetivo);
            if (id > 0) {
                return true;
            } else {
                return false;
            }
        } else {
        int filas = dao.guardarMetaExistente(objetivo);
            if (filas == 1) {
                return true;
            } else {
                return false;
            }
        }
        
    }
    
    
    public boolean eliminarMetaExistente(int id){
        MetasDAO dao = new MetasDAO();
        int filas = dao.eliminarMeta(id);
            
        if (filas == 1) {
            return true;
        } else {
            return false;
        }
    }
    
    
}
