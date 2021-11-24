package logica;

/**
 *
 * @author Carolina Bernal
 */
public class Ingreso {
    //Atributos
    private int id;
    private String tipoIngreso;
    private int idCategoriaIngreso;
    private String fechaIngreso;
    private double valorIngreso;
    private String descripcion;
    private int idUsuario;
    
    //Constructor sin parametros
    public Ingreso() {
    }
    
    //Constructor con parametros pero sin ID
    public Ingreso(String tipoIngreso, int idCategoriaIngreso, String fechaIngreso, double valorIngreso, String descripcion, int idUsuario) {
        this.tipoIngreso = tipoIngreso;
        this.idCategoriaIngreso = idCategoriaIngreso;
        this.fechaIngreso = fechaIngreso;
        this.valorIngreso = valorIngreso;
        this.descripcion = descripcion;
        this.idUsuario = idUsuario;
    }
    
    //Constructor con parametros
    public Ingreso(int id, String tipoIngreso, int idCategoriaIngreso, String fechaIngreso, double valorIngreso, String descripcion, int idUsuario) {
        this.id = id;
        this.tipoIngreso = tipoIngreso;
        this.idCategoriaIngreso = idCategoriaIngreso;
        this.fechaIngreso = fechaIngreso;
        this.valorIngreso = valorIngreso;
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

    public String getTipoIngreso() {
        return tipoIngreso;
    }

    public void setTipoIngreso(String tipoIngreso) {
        this.tipoIngreso = tipoIngreso;
    }

    public int getIdCategoriaIngreso() {
        return idCategoriaIngreso;
    }

    public void setIdCategoriaIngreso(int idCategoriaIngreso) {
        this.idCategoriaIngreso = idCategoriaIngreso;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public double getValorIngreso() {
        return valorIngreso;
    }

    public void setValorIngreso(double valorIngreso) {
        this.valorIngreso = valorIngreso;
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
