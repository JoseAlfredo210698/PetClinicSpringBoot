/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.citas;

import java.util.Collection;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.owner.Owner;
import org.springframework.samples.petclinic.owner.OwnerRepository;
import org.springframework.samples.petclinic.user.RoleRepository;
import org.springframework.samples.petclinic.user.User;
import org.springframework.samples.petclinic.user.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author legad
 */
@Controller
public class CitasController {

    private static final String VIEWS_OWNER_CREATE_OR_UPDATE_APPOINTMENT = "citas/appointment";
    private static final String VIEWS_ADMIN_CREATE_OR_UPDATE_APPOINTMENT = "citas/citasadmin";

    private final CitasRepository citas;
    private final EspecialidadesRepository especialidadesRepository;
    private final MascotasRepository mascotasRepository;

    @Autowired
    private OwnerRepository owners;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    private ModelAndView modelAndView;

    public CitasController(CitasRepository clinicService, EspecialidadesRepository especialidadesRepository,MascotasRepository mascotasRepository) {
        this.citas = clinicService;
        this.especialidadesRepository = especialidadesRepository;
        this.mascotasRepository = mascotasRepository;
    }

    @GetMapping("owner/cita")
    public String citaForm(Map<String, Object> model) {
        Citas cita = new Citas();
        
        Collection<Especialidades> especialidades = especialidadesRepository.getEspecialidades();
        System.out.println(especialidades.size());
        
        Collection<Mascotas> mascotas = mascotasRepository.getMascotas();
        System.out.println(mascotas.size());
        
        model.put("citas", cita);
        model.put("especialidades", especialidades);
        model.put("mascotas", mascotas);
        
        String username = "";
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        
        User temp = userRepository.findByEmail(username);
        Owner owner_temp = this.owners.findByUserId(temp.getId());
        System.out.println("usuario: " + temp);
        System.out.println("numero jaja: " + temp.getId());
        System.out.println("owner encontrado: " + owner_temp);
        System.out.println("id del owner encontrado: " + owner_temp.getId());
  
        
        model.put("idowner", this.owners.findById(owner_temp.getId()));

        return VIEWS_OWNER_CREATE_OR_UPDATE_APPOINTMENT;
    }

    @PostMapping("owner/cita")
    public String processMakeCita(@Valid Citas cita, BindingResult result) {
        System.out.println(result);
        if (result.hasErrors()) {
            System.out.println("MAL");
            return VIEWS_OWNER_CREATE_OR_UPDATE_APPOINTMENT;
        } else {
            String username = "";
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (principal instanceof UserDetails) {
                username = ((UserDetails) principal).getUsername();
            } else {
                username = principal.toString();
            }
            User temp = userRepository.findByEmail(username);
            Owner owner_temp = this.owners.findByUserId(temp.getId());
            /*String temp_pass = owner_temp.getUser().getPassword();
            String temp_username = owner_temp.getUser().getEmail();*/

            System.out.println("usuario: " + temp);
            System.out.println("numero jaja: " + temp.getId());
            System.out.println("owner encontrado: " + owner_temp);
            System.out.println("id del owner encontrado: " + owner_temp.getId());

            cita.setOwner(owner_temp);
            System.out.println("id del que estoy editandos, seniors homeros: " + cita.getId());

            System.out.println("cita con datos nuevos: " + cita);

            System.out.println("BIEN");
            cita.setConfirmacion(0);
            this.citas.save(cita);
            return "redirect:/owner/my_profile";
        }
    }
    
    @GetMapping("admin/citas")
    public String citaFormAdmin(Map<String, Object> model,Owner owner) {
        Citas cita = new Citas();
        
        Collection<Especialidades> especialidades = especialidadesRepository.getEspecialidades();
        System.out.println(especialidades.size());
        
        Collection<Mascotas> mascotas = mascotasRepository.getMascotas();
        System.out.println(mascotas.size());
        
        model.put("citas", cita);
        model.put("especialidades", especialidades);
        model.put("mascotas", mascotas);
        
        String username = "";
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        
        owner.setLastName(""); // empty string signifies broadest possible search
        
        Collection<Owner> results = this.owners.All();
        System.out.println("RESU "+results.size());
        /*User temp = userRepository.findByEmail(username);
        Collection<Owner> owners = this.owners.All();
        System.out.println("usuario: " + temp);
        System.out.println("numero jaja: " + temp.getId());
        System.out.println("owner encontrado: " + owner_temp);
        System.out.println("id del owner encontrado: " + owner_temp.getId());*/
       // model.put("owners", results);
        
        model.put("idowner", results);

        return VIEWS_ADMIN_CREATE_OR_UPDATE_APPOINTMENT;
    }
    
    @PostMapping("admin/citas")
    public String processMakeCitaAdmin(@Valid Citas cita, BindingResult result) {
        System.out.println(result);
        if (result.hasErrors()) {
            System.out.println("MAL");
            return VIEWS_ADMIN_CREATE_OR_UPDATE_APPOINTMENT;
        } else {
            String username = "";
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (principal instanceof UserDetails) {
                username = ((UserDetails) principal).getUsername();
            } else {
                username = principal.toString();
            }
            User temp = userRepository.findByEmail(username);
            Owner owner_temp = this.owners.findByUserId(temp.getId());
            String temp_pass = owner_temp.getUser().getPassword();
            String temp_username = owner_temp.getUser().getEmail();

            System.out.println("usuario: " + temp);
            System.out.println("numero jaja: " + temp.getId());
            System.out.println("owner encontrado: " + owner_temp);
            System.out.println("id del owner encontrado: " + owner_temp.getId());

            cita.setOwner(owner_temp);
            System.out.println("id del que estoy editandos, seniors homeros: " + cita.getId());

            System.out.println("cita con datos nuevos: " + cita);

            System.out.println("BIEN");
            this.citas.save(cita);
            return VIEWS_ADMIN_CREATE_OR_UPDATE_APPOINTMENT;
        }
    }
}
