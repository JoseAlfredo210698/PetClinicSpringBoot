/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.user;

import java.nio.charset.StandardCharsets;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Collection;
import java.util.Map;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.client.RestTemplate;


/**
 *
 * @author AugustoRuCle
 */
@Controller
public class UserController {
    private String URL_api_zipcode = "https://api-codigos-postales.herokuapp.com/v2/buscar?codigo_postal=";
    
    private final UserRepository users;


    public UserController(UserRepository clinicService) {
        this.users = clinicService;
    }
    
    @GetMapping("/user/create")
    public ModelAndView Create(Map<String, Object> model) {
        User user = new User();
        ModelAndView modelAndView = new ModelAndView("user/create");
        modelAndView.addObject("user", user);
        modelAndView.addObject("exitsZipcode", true);
        return modelAndView;
    }
    
    @PostMapping("/user/create")
    public ModelAndView SaveUser(@Valid User user, BindingResult result) {
        ModelAndView modelAndView = new ModelAndView();
        RestTemplate restTemplate = new RestTemplate();
        String password = user.getPassword();
        if (result.hasErrors()) {
            return modelAndView;
        } else {
            Object quote = restTemplate.getForObject(this.URL_api_zipcode+user.getZipcode(), Object.class);
            String data = quote.toString();
            data = data.substring(data.indexOf("[")+1, data.length()-2);
            
            if(data.length() == 0){
                modelAndView.setViewName("user/create");
                modelAndView.addObject("exitsZipcode", false);
                return modelAndView;
            }
            modelAndView.setViewName("Usuario");
            password = DigestUtils.sha256Hex(password);
            user.setPassword(password);
            this.users.save(user);
            return modelAndView;
        }
    }

}
