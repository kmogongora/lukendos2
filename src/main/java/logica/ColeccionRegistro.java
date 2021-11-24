/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.ArrayList;
import java.util.TreeMap;
import persistencia.RegistroDAO;
/**
 *
 * @author Andres
 */
/**
 * Contiene la lógica requerida para gestionar la información de los usuarios
 */
public class ColeccionRegistro {
     //Atributos
    private ArrayList<Usuario> listado;
    
    public ArrayList<Usuario> getLista(){
        return listado;
    }
    
    //Obtiene el valor del genero seleccionado por el usuario
    public String getGeneroUsuario(int key){
        RegistroDAO dao = new RegistroDAO();
        TreeMap<Integer, String> listaGenerosUsuarios = dao.cargarGeneroUsuarios();
        String value = listaGenerosUsuarios.get(key);
        return value;
    }
    
    //Obtiene el valor del genero seleccionado por el usuario
    public String getTipoUsuario(int key){
        RegistroDAO dao = new RegistroDAO();
        TreeMap<Integer, String> listaTiposUsuarios = dao.cargarTiposUsuarios();
        String value = listaTiposUsuarios.get(key);
        return value;
    }
    
    public boolean cargarUsuarios(){
        RegistroDAO dao = new RegistroDAO();//Instanciamos un objeto de la clase UsuarioDAO para que él ejecute el SQL
        listado = dao.consultarUsuario(); //Ejecutamos el metodo y el DAO devuelve un ArrayList que almacenara en nuestra varible lista
        // Creamos una sentecia que validará el tamaño de la lista y retornara un True o False dependiendo si hay o no registros
        if (listado.size() > 0) {
            return true;
        } 
        else {
           return false; 
        }
    }
    
        /**
     * Guarda la información de un usuario capturada desde el formulario
     *
     * @param u un objeto con los datos de un juguete específico
     * @return true si guarda el juguete en la base de datos, o false si no lo
     * guarda
     */
    public boolean guardarUsuario(Usuario user) {
        RegistroDAO dao = new RegistroDAO();
        int id = dao.guardarNuevoUsuario(user);
        if (id > 0) {
            return true;
        } else {
            return false;
        }
    }
}