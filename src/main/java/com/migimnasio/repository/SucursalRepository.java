package com.migimnasio.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.migimnasio.model.Sucursal;

// Acceso a la tabla sucursales
public interface SucursalRepository extends JpaRepository<Sucursal, Integer> {
}
