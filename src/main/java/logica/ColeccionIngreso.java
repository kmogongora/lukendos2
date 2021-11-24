
package logica;

import java.util.ArrayList;
import java.util.TreeMap;
import persistencia.IngresoDAO;
/**
 *
 * @author Andres
 */
public class ColeccionIngreso {
    //Atributos
    private ArrayList<Ingreso> listadoIngresos;
    
    public ArrayList<Ingreso> getLista(){
        return listadoIngresos;
    }
    
   //Método para sumar los valor de los egresos en la lista
   public double totalIngreso(){
        double totalIngreso = 0.0;
        for(int i=0; i < listadoIngresos.size(); i++){
            totalIngreso = totalIngreso + listadoIngresos.get(i).getValorIngreso();
        }
        return totalIngreso;
   }
    
    public String getCategoriaIngreso(int key){
        IngresoDAO dao = new IngresoDAO();
        TreeMap<Integer, String> listaCtegoriaIngresos = dao.cargarCategoriaIngresos();
        String value = listaCtegoriaIngresos.get(key);
        return value;
    }    
    
    public TreeMap<Integer, String> getCategoriaIngresos() {
        IngresoDAO dao = new IngresoDAO();
        TreeMap<Integer, String> listaCategoriaIngresos = dao.cargarCategoriaIngresos();
        return listaCategoriaIngresos;
    }
    
    
    public boolean cargarIngreso(){
        IngresoDAO dao = new IngresoDAO();
        listadoIngresos = dao.consultarIngresos();
        
        if (listadoIngresos.size() > 0) {
            return true;
        } 
        else {
           return false; 
        }
        
    }
    
   public Ingreso cargarUnIngreso(int id) {
        IngresoDAO dao = new IngresoDAO();
        Ingreso spend = dao.consultarIngresoId(id);
        return spend;
    }
    
    public boolean guardarNuevoIngreso  (Ingreso spend) {
        IngresoDAO dao = new IngresoDAO();
        int id = dao.guardarNuevoIngreso(spend);
        if (id > 0) {
            return true;
        } else {
            return false;
        }
    }
    public boolean eliminarIngresoExistente(int id){
        IngresoDAO dao = new IngresoDAO();
        int filas = dao.eliminarIngreso(id);
            
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
    public double cargarSumaIngresos(int idUsuario) {
        IngresoDAO dao = new IngresoDAO();
        double d = dao.sumaIngresoTotal(idUsuario);
        return d;
    }
    public boolean cargarIngresosPorFiltro(String filtroFechaDesde, String filtroFechaHasta) {
        IngresoDAO dao = new IngresoDAO();
        listadoIngresos = dao.consultarIngresosPorFiltro(filtroFechaDesde,filtroFechaHasta );
        if (listadoIngresos.size() > 0) {
            return true;
        }
        else {
            return false;
        }
      
    }
}
