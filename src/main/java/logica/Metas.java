
package logica;

/**
 *
 * @author Carolina Bernal
 */
public class Metas {
    //Atributos
    private int id;
    private String nombre;
    private double valorTotal;
    private double valorParcial;
    private String fechaObjetiva;
    private int idUsuario;
    
    //Constructor sin parametros
    public Metas() {
    }
    
    //Constructor con parametros pero sin ID
    public Metas(String nombre, double valorTotal, double valorParcial, String fechaObjetiva, int idUsuario) {
        this.nombre = nombre;
        this.valorTotal = valorTotal;
        this.valorParcial = valorParcial;
        this.fechaObjetiva = fechaObjetiva;
        this.idUsuario = idUsuario;
    }
    
    //Constructor con parametros
    public Metas(int id, String nombre, double valorTotal, double valorParcial, String fechaObjetiva, int idUsuario) {
        this.id = id;
        this.nombre = nombre;
        this.valorTotal = valorTotal;
        this.valorParcial = valorParcial;
        this.fechaObjetiva = fechaObjetiva;
        this.idUsuario = idUsuario;
    }
    
    //Metodos para encapsular atributos. Setters y Getters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public double getValorParcial() {
        return valorParcial;
    }

    public void setValorParcial(double valorParcial) {
        this.valorParcial = valorParcial;
    }

    public String getFechaObjetiva() {
        return fechaObjetiva;
    }

    public void setFechaObjetiva(String fechaObjetiva) {
        this.fechaObjetiva = fechaObjetiva;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
}
