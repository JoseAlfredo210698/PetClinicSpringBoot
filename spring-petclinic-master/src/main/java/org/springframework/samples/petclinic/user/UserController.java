/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.user;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
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
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.DelegatingPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author AugustoRuCle
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    private ModelAndView modelAndView;

    private final UserRepository users;

    public UserController(UserRepository clinicService) {
        this.users = clinicService;
    }

    @GetMapping("/home")
    public ModelAndView init() {
        modelAndView = new ModelAndView("user/home");
        return modelAndView;
    }

    @GetMapping("/create")
    public ModelAndView Create(Map<String, Object> model) {
        User user = new User();
        modelAndView = new ModelAndView("user/create");
        modelAndView.addObject("user", user);
        modelAndView.addObject("exitsZipcode", true);
        modelAndView.addObject("exitsEmail", true);
        return modelAndView;
    }

    @PostMapping("/create")
    public ModelAndView Save(@Valid User user, BindingResult result) {
        modelAndView = new ModelAndView();
        String password = user.getPassword();

        if (result.hasErrors()) {
            return modelAndView;
        } else {
            User _user = this.users.findByEmail(user.getEmail());

            if (userService.exitsZipCode(user.getZipcode())) {
                modelAndView.setViewName("user/create");
                modelAndView.addObject("exitsZipcode", false);
                return modelAndView;
            }

            if (_user == null) {
                //apartado para crear password --kevin                
                Map encoders = new HashMap<>();
                encoders.put("bcrypt", new BCryptPasswordEncoder());
                PasswordEncoder passwordEncoder = new DelegatingPasswordEncoder("bcrypt", encoders);
                password = passwordEncoder.encode(password);
                user.setPassword(password);
                //////////
                this.users.save(user);
                return this.ViewListUser();
            } else {
                modelAndView.setViewName("user/create");
                modelAndView.addObject("exitsEmail", false);
                return modelAndView;
            }
        }
    }

    @GetMapping("/list")
    public ModelAndView List() {
        modelAndView = this.ViewListUser();
        return modelAndView;
    }

    @GetMapping("/UpdateDelete/{id}")
    public ModelAndView update_delete(@PathVariable("id") int id) {
        modelAndView = new ModelAndView("update_delete");
        modelAndView.addObject("user", users.findById(id));
        return modelAndView;
    }

    @PutMapping("/update/{id}")
    public ModelAndView Update(@Valid User user, @PathVariable("id") int id) {
        modelAndView.setViewName("user/update_delete");
        return modelAndView;
    }

    @DeleteMapping("/delete/{id}")
    public ModelAndView Delete(@Valid User user, @PathVariable("id") int id) {
        modelAndView.setViewName("user/update_delete");
        return modelAndView;
    }

    private ModelAndView ViewListUser() {
        ModelAndView _modelAndView = new ModelAndView("user/list");
        ArrayList<User> users = this.users.All();
        _modelAndView.addObject("users", users);
        return _modelAndView;
    }

}
