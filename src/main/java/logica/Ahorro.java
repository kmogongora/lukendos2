package logica;

/**
 *
 * @author Carolina Bernal
 */
public class Ahorro {
    //Atributos
    private int id;
    private String fechaAhorro;
    private double valorAhorro;
    private String descripcion;
    private int idUsuario;
    
    //Constructor sin parametros
    public Ahorro() {
    }
    
    //Constructor con parametros pero sin ID
    public Ahorro(String fechaAhorro, double valorAhorro, String descripcion, int idUsuario) {
        
        this.fechaAhorro = fechaAhorro;
        this.valorAhorro = valorAhorro;
        this.descripcion = descripcion;
        this.idUsuario = idUsuario;
    }
    
    //Constructor con parametros
    public Ahorro(int id, String fechaAhorro, double valorAhorro, String descripcion, int idUsuario) {
        this.id = id;
      
        this.fechaAhorro = fechaAhorro;
        this.valorAhorro = valorAhorro;
        this.descripcion = descripcion;
        this.idUsuario = idUsuario;
    }

    //Metodos para encapsular atributos. Setters y Getters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

  

    public String getFechaAhorro() {
        return fechaAhorro;
    }

    public void setFechaAhorro(String fechaAhorro) {
        this.fechaAhorro = fechaAhorro;
    }

    public double getValorAhorro() {
        return valorAhorro;
    }

    public void setValorAhorro(double valorAhorro) {
        this.valorAhorro = valorAhorro;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    
}
