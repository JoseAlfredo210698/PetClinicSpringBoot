package org.springframework.samples.petclinic.appointment;

import java.util.Collection;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.Valid;
import java.util.Map;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AppointmentController {

    private final AppointmentRepository appointmentRepository;
    private final SpecialtieRepository specialtieRepository;

    private static final String VIEW_PRODUCTO_REPORT = "appointment/appointment-report";
    private static final String VIEW_PRODUCTO_REPORT_BY_SPECIALTIE = "appointment/appointment-report-by-specialtie";

    public AppointmentController(AppointmentRepository appointmentRepository, SpecialtieRepository specialtieRepository) {
        this.appointmentRepository = appointmentRepository;
        this.specialtieRepository = specialtieRepository;
    }

    @GetMapping("/appointments/report")
    public String initFindForm(Map<String, Object> model) {
        Collection<Specialties> allSpecialties = this.specialtieRepository.getSpecialties();
        model.put("allSpecialties", allSpecialties);
        return VIEW_PRODUCTO_REPORT;
    }

    @GetMapping("/appointment/report/{specialtieId}")
    public String report(Map<String, Object> model, @PathVariable("specialtieId") int specialtieId) {
        Collection<AppointmentReport> allAppointments;
        System.out.println(this.appointmentRepository.getAppointments(1).size());
        if (specialtieId > 0) {
            allAppointments = this.appointmentRepository.getAppointments(specialtieId);
            Specialties specialtie = this.specialtieRepository.getSpecialtieById(specialtieId);
            model.put("specialtie", specialtie.getName());
            System.out.println(allAppointments.size());
            model.put("allAppointments", allAppointments);
        } else {
            if (specialtieId == 0) {
                allAppointments = this.appointmentRepository.getAppointmentsByConfirmation(0);
                model.put("specialtie", "No confirmados");
            }else{
                allAppointments = this.appointmentRepository.getAppointmentsByConfirmation(1);
                model.put("specialtie", "Confirmados");
            }
            model.put("allAppointments", allAppointments);
        }

        return VIEW_PRODUCTO_REPORT_BY_SPECIALTIE;
    }
}
