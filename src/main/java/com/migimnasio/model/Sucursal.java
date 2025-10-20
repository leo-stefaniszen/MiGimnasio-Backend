package com.migimnasio.model;

import javax.persistence.*;

@Entity
@Table(name = "sucursales")
public class Sucursal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_sucursal;

    private String nombre_sucursal;
    private String telefono_sucursal;
    private String direccion_sucursal;

    public Sucursal() {}

    public Sucursal(String nombre, String telefono, String direccion) {
        this.nombre_sucursal = nombre;
        this.telefono_sucursal = telefono;
        this.direccion_sucursal = direccion;
    }

    public int getId_sucursal() {
        return id_sucursal;
    }

    public void setId_sucursal(int id_sucursal) {
        this.id_sucursal = id_sucursal;
    }

    public String getNombre_sucursal() {
        return nombre_sucursal;
    }

    public void setNombre_sucursal(String nombre_sucursal) {
        this.nombre_sucursal = nombre_sucursal;
    }

    public String getTelefono_sucursal() {
        return telefono_sucursal;
    }

    public void setTelefono_sucursal(String telefono_sucursal) {
        this.telefono_sucursal = telefono_sucursal;
    }

    public String getDireccion_sucursal() {
        return direccion_sucursal;
    }

    public void setDireccion_sucursal(String direccion_sucursal) {
        this.direccion_sucursal = direccion_sucursal;
    }
}
