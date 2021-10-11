package com.emergentes.modelo;
public class Tarea {
    private int id;
    private String tarea;
    private String prioridad;
    private boolean completado; 
    public Tarea() {
        this.id = 0;
        this.tarea = "";
        this.prioridad = "";
        this.completado = false;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTarea() {
        return tarea;
    }
    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    public String getPrioridad() {
        return prioridad;
    }
    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }
    public boolean isCompletado() {
        return completado;
    }
    public void setCompletado(boolean completado) {
        this.completado = completado;
    } 
}
