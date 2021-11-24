
package logica;

import java.sql.*;

/**
 *
 * @author Carolina
 */
public class Usuario {
    //Atributos
    private int id;
    private String documento;
    private String nombre;
    private String apellido;
    private String fechaNacimiento; //Formato: yyyy-mm-dd
    private int idGenero;
    private String email;
    private String nombreUsuario; 
    private String claveAcceso;
    private String estado;
    private int idRol;

    //Constructor sin parametros
    public Usuario() {
    }

    //Constructor con parametros pero sin ID
    public Usuario(String documento, String nombre, String apellido, String fechaNacimiento, int idGenero, String email, String nombreUsuario, String claveAcceso, String estado, int idRol) {
        this.documento = documento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.idGenero = idGenero;
        this.email = email;
        this.nombreUsuario = nombreUsuario;
        this.claveAcceso = claveAcceso;
        this.estado = estado;
        this.idRol = idRol;
    }

     //Constructor con parametros
    public Usuario(int id, String documento, String nombre, String apellido, String fechaNacimiento, int idGenero, String email, String nombreUsuario, String claveAcceso, String estado, int idRol) {
        this.id = id;
        this.documento = documento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.idGenero = idGenero;
        this.email = email;
        this.nombreUsuario = nombreUsuario;
        this.claveAcceso = claveAcceso;
        this.estado = estado;
        this.idRol = idRol;
    }
    
    //Metodos para encapsular atributos. Setters y Getters.
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getClaveAcceso() {
        return claveAcceso;
    }

    public void setClaveAcceso(String claveAcceso) {
        this.claveAcceso = claveAcceso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

}
