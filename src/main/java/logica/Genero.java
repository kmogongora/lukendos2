package logica;

/**
 *
 * @author Carolina
 */
public class Genero {
    //Atributos
    private int idGenero;
    private String nombre;
    
    //Constructor sin parametros
    public Genero() {
    }
    
    //Constructor con parametros pero sin ID
    public Genero(String nombre) {
        this.nombre = nombre;
    }
    
    
    //Constructor con parametros
    public Genero(int idGenero, String nombre) {
        this.idGenero = idGenero;
        this.nombre = nombre;
    }

    //Metodos para encapsular atributos (Setters y Getters)
    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
