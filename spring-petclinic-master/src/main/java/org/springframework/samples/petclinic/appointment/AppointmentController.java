package org.springframework.samples.petclinic.appointment;

import org.springframework.samples.petclinic.product.*;
import java.util.Collection;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.Valid;
import java.util.Map;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AppointmentController {

    private final AppointmentRepository appointmentRepository;
    private static final String VIEW_APPOINTMENT_REPORT = "appointment/appointment-report";


    @GetMapping("/products/report")
    public String report(Map<String, Object> model) {
        Collection<Product> allProducts = this.productRepository.getAllProducts();
        model.put("allProducts", allProducts);
        return VIEW_APPOINTMENT_REPORT;
    }

}
