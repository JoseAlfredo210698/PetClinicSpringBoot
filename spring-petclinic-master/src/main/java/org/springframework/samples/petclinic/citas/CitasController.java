/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.citas;

import java.util.Map;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author legad
 */
@Controller
public class CitasController {
    
    private static final String VIEWS_OWNER_CREATE_OR_UPDATE_APPOINTMENT = "citas/appointment";
    
    private final CitasRepository citas;
    
    public CitasController(CitasRepository clinicService) {
        this.citas = clinicService;
    }

    
    @GetMapping("owner/cita")
    public String citaForm(Map<String, Object> model) {
        Citas cita = new Citas();
        model.put("citas", cita);
        return VIEWS_OWNER_CREATE_OR_UPDATE_APPOINTMENT;
    }
    
    @PostMapping("owner/cita")
    public String processMakeCita(@Valid Citas cita, BindingResult result) {
        if (result.hasErrors()) {
            System.out.println("MAL");
            return VIEWS_OWNER_CREATE_OR_UPDATE_APPOINTMENT;
        } else {
            System.out.println("BIEN");
            this.citas.save(cita);
            return "redirect:/owner/my_profile";
        }
    }
}
