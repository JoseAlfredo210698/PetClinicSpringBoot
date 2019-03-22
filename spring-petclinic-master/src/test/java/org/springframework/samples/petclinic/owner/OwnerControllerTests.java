/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.owner;

import org.junit.Before;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.junit.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.test.context.support.WithMockUser;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.*;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.web.util.NestedServletException;

/**
 *
 * @author katZ_
 */
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc //need this in Spring Boot test
public class OwnerControllerTests {

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private MockMvc mvc;

    @Before
    public void setup() {
        mvc = MockMvcBuilders
                .webAppContextSetup(context)
                .apply(springSecurity())
                .build();
    }
    
    @Test
    public void testOwnerSignUpGet() throws Exception {
        mvc.perform(get("/owner_signup"))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("pet"))
                .andExpect(view().name("owners/createOrUpdateOwnerFormInicial"));
    }
    
    @Test
    public void testOwnerSignUpPost() throws Exception {
        MockMultipartFile file = new MockMultipartFile("file", new byte[1]);
        
        mvc.perform(MockMvcRequestBuilders.multipart("/owner_signup").file(file)
                .param("owner.firstName", "Borrar")
                .param("owner.lastName", "ownersito")
                .param("owner.address", "Calle Glorioso Lodasal")
                .param("owner.city", "Tuxtlas")
                .param("owner.telephone", "123456")
                .param("owner.user.email", "borrar@porfavor.com")
                .param("owner.user.password", "")                
                .param("owner.longitud", "1")
                .param("owner.latitud", "1")
                .param("name", "Borrar") 
                .param("birthDate", "2000-09-07") 
                .param("type", "bird")                 
        )
                .andExpect(status().is3xxRedirection())
                .andExpect(view().name("redirect:/login"));
    }
    
    @WithMockUser(username = "owner@owner.com", authorities = { "OWNER_PRIVILEGE" }) //owner
    @Test
    public void testMyProfileGet() throws Exception {
        mvc.perform(get("/owner/my_profile"))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("owner"))
                .andExpect(view().name("owners/createOrUpdateOwnerForm"));
    }

    @WithMockUser(username = "owner@owner.com", authorities = { "OWNER_PRIVILEGE" }) //owner
    @Test
    public void testMyProfilePost() throws Exception {
        MockMultipartFile file = new MockMultipartFile("file", new byte[1]);
        
        mvc.perform(MockMvcRequestBuilders.multipart("/owner/my_profile").file(file)
                .param("firstName", "Don owner")
                .param("lastName", "ownersito")
                .param("address", "Calle Glorioso Lodasal")
                .param("city", "Tuxtlas")
                .param("telephone", "123456")
                .param("user.email", "owner@owner.com")
                .param("user.password", "")                
                .param("longitud", "1")
                .param("latitud", "1")                
                //.with(csrf())
        )
                .andExpect(status().is3xxRedirection())
                .andExpect(view().name("redirect:/owner/my_profile"));
    }
    
    @WithMockUser(username = "owner@owner.com", authorities = { "OWNER_PRIVILEGE" }) //owner
    @Test(expected = NestedServletException.class)//sorry no hay binder, pero se que no puede romper reglas,
    //le hace un redirect diciendo que hubo un error porque el nombre esta muy largo
    public void testMyProfilePostFail() throws Exception {
        MockMultipartFile file = new MockMultipartFile("file", new byte[1]);
        
        mvc.perform(MockMvcRequestBuilders.multipart("/owner/my_profile").file(file)
                .param("firstName", "Don ownerrrrrrrrrrrrrrrrrrrrrrrrrrrrrr44444444444444444"
                        + "444444444444444444444444444444444444444rrrrrr")
                .param("lastName", "ownersito")
                .param("address", "Calle Glorioso Lodasal")
                .param("city", "Tuxtlas")
                .param("telephone", "123456")
                .param("user.email", "owner@owner.com")
                .param("user.password", "")                
                .param("longitud", "1")
                .param("latitud", "1")                
                //.with(csrf())
        )
                .andExpect(status().is3xxRedirection());                
    }
    
    @WithMockUser(username = "test", authorities = { "ADMIN_PRIVILEGE" }) //owner
    @Test
    public void testListOwnersGet() throws Exception {
        mvc.perform(get("/admin/user/owners"))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("users"))
                .andExpect(view().name("user/list_owner"));
    }
}
