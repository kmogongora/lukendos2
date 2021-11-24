package logica;

/**
 *
 * @author Carolina
 */
public class Rol {
    //Atributos
    private int idRol;
    private String nombre;
    
    //Constructor sin parametros
    public Rol() {
    }
    
    //Constructor con parametros pero sin ID
    public Rol(String nombre) {
        this.nombre = nombre;
    }
    
    
    //Constructor con parametros
    public Rol(int idRol, String nombre) {
        this.idRol = idRol;
        this.nombre = nombre;
    }
    
    //Metodos para encapsular atributos (Setters y Getters)
    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    } 
}
