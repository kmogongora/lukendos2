package logica;

/**
 *
 * @author Carolina Bernal
 */
public class Egreso {
    //Atributos
    private int id;
    private String tipoEgreso;
    private int idCategoriaEgreso;
    private String fechaEgreso;
    private double valorEgreso;
    private String descripcion;
    private int idUsuario;
    
    //Constructor sin parametros
    public Egreso() {
    }
    
    //Constructor con parametros pero sin ID
    public Egreso(String tipoEgreso, int idCategoriaEgreso, String fechaEgreso, double valorEgreso, String descripcion, int idUsuario) {
        this.tipoEgreso = tipoEgreso;
        this.idCategoriaEgreso = idCategoriaEgreso;
        this.fechaEgreso = fechaEgreso;
        this.valorEgreso = valorEgreso;
        this.descripcion = descripcion;
        this.idUsuario = idUsuario;
    }
    
    //Constructor con parametros
    public Egreso(int id, String tipoEgreso, int idCategoriaEgreso, String fechaEgreso, double valorEgreso, String descripcion, int idUsuario) {
        this.id = id;
        this.tipoEgreso = tipoEgreso;
        this.idCategoriaEgreso = idCategoriaEgreso;
        this.fechaEgreso = fechaEgreso;
        this.valorEgreso = valorEgreso;
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

    public String getTipoEgreso() {
        return tipoEgreso;
    }

    public void setTipoEgreso(String tipoEgreso) {
        this.tipoEgreso = tipoEgreso;
    }

    public int getIdCategoriaEgreso() {
        return idCategoriaEgreso;
    }

    public void setIdCategoriaEgreso(int idCategoriaEgreso) {
        this.idCategoriaEgreso = idCategoriaEgreso;
    }

    public String getFechaEgreso() {
        return fechaEgreso;
    }

    public void setFechaEgreso(String fechaEgreso) {
        this.fechaEgreso = fechaEgreso;
    }

    public double getValorEgreso() {
        return valorEgreso;
    }

    public void setValorEgreso(double valorEgreso) {
        this.valorEgreso = valorEgreso;
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
