
package logica;

import java.util.ArrayList;
import java.util.TreeMap;
import persistencia.AhorroDAO;
/**
 *
 * @author Andres
 */
public class ColeccionAhorro {
    //Atributos
    private ArrayList<Ahorro> listadoAhorros;
    
    
    public ArrayList<Ahorro> getLista(){
        return listadoAhorros;
    }
    
   //Método para sumar los valor de los egresos en la lista
   public double totalAhorro(){
        double totalAhorro = 0.0;
        for(int i=0; i < listadoAhorros.size(); i++){
            totalAhorro = totalAhorro + listadoAhorros.get(i).getValorAhorro();
        }
        return totalAhorro;
   }
    
   
    
    
    public boolean cargarAhorro(){
        AhorroDAO dao = new AhorroDAO();
        listadoAhorros = dao.consultarAhorros();
        
        if (listadoAhorros.size() > 0) {
            return true;
        } 
        else {
           return false; 
        }
    }
    
    /**
     * Carga la información de un solo Ahorro de la base de datos
     * @return true si carga los Ahorros, o false si no se logró cargar
     */
    public Ahorro cargarUnAhorro(int id) {
        AhorroDAO dao = new AhorroDAO();
        Ahorro spend = dao.consultarAhorroId(id);
        return spend;
    }
    

    public boolean guardarNuevoAhorro  (Ahorro spend) {
        AhorroDAO dao = new AhorroDAO();
        
        if (spend.getId() == 0) {
            int id = dao.guardarNuevoAhorro(spend);
            if (id > 0) {
                return true;
            } else {
                return false;
            }
        } else {
        int filas = dao.guardarAhorroExistente(spend);
            if (filas == 1) {
                return true;
            } else {
                return false;
            }
        }
        
    }
    
    
    public boolean eliminarAhorroExistente(int id){
        AhorroDAO dao = new AhorroDAO();
        int filas = dao.eliminarAhorro(id);
            
        if (filas == 1) {
            return true;
        } else {
            return false;
        }
    }
    
        /**
     * Carga la información del gasto total de un usuario de la base de datos
     * @return true si carga gasto, o false si no se logró cargar
     */
    public double cargarSumaAhorros(int idUsuario) {
        AhorroDAO dao = new AhorroDAO();
        double d = dao.sumaAhorroTotal(idUsuario);
        return d;
    }
    
        /**
     * Carga la información de ciertos gastos de la base de datos mediante filtro
     * @return true si carga los Ahorros, o false si no se logró cargar
     */
    public boolean cargarAhorrosPorFiltro(String filtroFechaDesde, String filtroFechaHasta) {
        AhorroDAO dao = new AhorroDAO();
        listadoAhorros = dao.consultarAhorrosPorFiltro(filtroFechaDesde,filtroFechaHasta );
        if (listadoAhorros.size() > 0) {
            return true;
        }
        else {
            return false;
        }
    }
    
  
}
