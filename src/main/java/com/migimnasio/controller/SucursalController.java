package com.migimnasio.controller;

import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.migimnasio.model.Sucursal;
import com.migimnasio.repository.SucursalRepository;

@RestController
@RequestMapping("/sucursales")
@CrossOrigin("*")
public class SucursalController {

    private final SucursalRepository sucursalRepo;

    public SucursalController(SucursalRepository sucursalRepo) {
        this.sucursalRepo = sucursalRepo;
    }

    // Devuelve todas las sucursales de la base
    @GetMapping
    public List<Sucursal> getAll() {
        return sucursalRepo.findAll();
    }
}
