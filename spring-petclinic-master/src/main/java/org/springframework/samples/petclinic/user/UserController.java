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
import java.util.Map;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

    private User auxUser;

    public UserController(UserRepository clinicService) {
        this.users = clinicService;
    }
    
    @GetMapping("/home")
    public ModelAndView init (){
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
        
        int exitError = this.exitsError(user, result);
        
        switch(exitError){
            case 1:
                return modelAndView;
            case 2:
                modelAndView.setViewName("user/create");
                modelAndView.addObject("exitsZipcode", false);
                return modelAndView; 
            case 3:
                modelAndView.setViewName("user/create");
                modelAndView.addObject("exitsEmail", false); 
                return modelAndView;
        }
        
        user.setPassword(DigestUtils.sha256Hex(user.getPassword()));   
        this.users.save(user);
        return this.ViewListUser();          
    }
   
    @GetMapping("/list")
    public ModelAndView List() {
        modelAndView = this.ViewListUser();
        return modelAndView;
    }
   
    @GetMapping("/update/{id}")
    public ModelAndView update(@PathVariable("id") int id) {
        this.auxUser = users.findById(id);
        modelAndView = new ModelAndView("user/update_delete");
        modelAndView.addObject("user", this.auxUser);
        modelAndView.addObject("exitsError", false);
        return modelAndView;
    }
   
    
    @PostMapping("/update/{id}")
    public ModelAndView update(@Valid User user, BindingResult result, @PathVariable("id") int id) {
        int exitError = this.exitsError(user, result);
        if(exitError != 0){
            if( exitError == 3 && !this.auxUser.getEmail().equals(user.getEmail()) ){
                modelAndView = new ModelAndView("user/update_delete");
                modelAndView.addObject("user", users.findById(id));
                modelAndView.addObject("exitsError", true);
                //modelAndView.addObject("message", "1:"+exitError);
                return modelAndView;
            }else if(exitError == 1 || exitError == 2){
                modelAndView = new ModelAndView("user/update_delete");
                modelAndView.addObject("user", users.findById(id));
                modelAndView.addObject("exitsError", true);
                //modelAndView.addObject("message", "2:"+ exitError);               
                return modelAndView;               
            }
        }
        user.setId(id);
        this.users.save(user);
        return this.ViewListUser();
    }
    
    @GetMapping("/delete/{id}")
    public ModelAndView Delete(@PathVariable("id") int id) {
        User user = users.findById(id);
        if(user.getActive().equals("1"))
            user.setActive("0");
        else
            user.setActive("1");
        users.save(user);
        return this.ViewListUser();
    }
    
    
    private ModelAndView ViewListUser(){
        ModelAndView _modelAndView = new ModelAndView("user/list");
        ArrayList<User> users = this.users.All();
        _modelAndView.addObject("users", users);
        return _modelAndView;
    }

    public int exitsError(User user, BindingResult result){
        String password = user.getPassword();
        if (result.hasErrors()) {
            return 1;
        }else {
            
            if(userService.exitsZipCode(user.getZipcode()))
                return 2;
            
            if(this.users.findByEmail(user.getEmail()) != null)
                return 3;
        }
        return 0;
    }

}
