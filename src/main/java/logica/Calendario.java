package logica;

import java.util.GregorianCalendar;

public class Calendario {

    private String mesNom;
    private int mesNum;

    public Calendario() {

    }

    public String CalMes() {

        mesNum = ((new java.util.GregorianCalendar()).get(java.util.Calendar.MONTH));
        mesNom = "";
        switch (mesNum) {
            case 0:
                mesNom = "Enero";
                break;
            case 1:
                mesNom = "Febrero";
                break;
            case 2:
                mesNom = "Marzo";
                break;
            case 3:
                mesNom = "Abril";
                break;
            case 4:
                mesNom = "Mayo";
                break;
            case 5:
                mesNom = "Junio";
                break;
            case 6:
                mesNom = "Julio";
                break;
            case 7:
                mesNom = "Agosto";
                break;
            case 8:
                mesNom = "Septiembre";
                break;
            case 9:
                mesNom = "Octubre";
                break;
            case 10:
                mesNom = "Noviembre";
                break;
            case 11:
                mesNom = "DICIEMBRE";
                break;

        } return mesNom;
    }

    
}
