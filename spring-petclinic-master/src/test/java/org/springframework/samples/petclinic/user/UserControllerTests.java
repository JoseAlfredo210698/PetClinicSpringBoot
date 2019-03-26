/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.user;

import org.junit.Before;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
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
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc //need this in Spring Boot test
public class UserControllerTests {
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
    
    @WithMockUser(username = "test", authorities = { "ADMIN_PRIVILEGE" })
    @Test
    public void testInitCreationForm() throws Exception {
        mvc.perform(get("/user/home"))
            .andExpect(status().isOk())
            .andExpect(view().name("user/list"));
    }
    
    @WithMockUser(username = "test", authorities = { "ADMIN_PRIVILEGE" })
    @Test
    public void testDeleteGet() throws Exception {
        mvc.perform(get("/user/delete/45"))
            .andExpect(status().isOk())
            .andExpect(view().name("user/list"));
    }	
    
    @WithMockUser(username = "test", authorities = { "ADMIN_PRIVILEGE" })
    @Test
    public void testCreateGet() throws Exception {
        mvc.perform(get("/user/create"))
            .andExpect(status().isOk())
            .andExpect(model().attributeExists("user"))
            .andExpect(model().attributeExists("exitsZipcode"))
            .andExpect(model().attributeExists("exitsEmail"))
            .andExpect(view().name("user/create"));
    }	    
    
    @WithMockUser(username = "test", authorities = { "ADMIN_PRIVILEGE" })
    @Test
    public void testCreatePost() throws Exception {
        mvc.perform(post("/user/create")
            .param("email", "admin@admin4")
            .param("firstName", "admin")
            .param("lastName", "admin")
            .param("password", "1234") 
            .param("active", "1")         
            .param("city", "tuxtla gutierrez")
            .param("zipcode", "29010")    
            .param("telephone", "123")  
        )
            .andExpect(status().isOk())
            .andExpect(view().name("user/list"));
    }	
     
    @WithMockUser(username = "test", authorities = { "ADMIN_PRIVILEGE" })
    @Test
    public void testUpdateGet() throws Exception {
        mvc.perform(get("/user/update/20"))
            .andExpect(model().attributeExists("user"))
            .andExpect(model().attributeExists("exitsError"))
            .andExpect(status().isOk())
            .andExpect(view().name("user/update_delete"));
    }
    
    @WithMockUser(username = "test", authorities = { "ADMIN_PRIVILEGE" })
    @Test
    public void testUpdatePost() throws Exception {
        mvc.perform(post("/user/update/44")
            .param("email", "admin@admin5")
            .param("firstName", "admin2")
            .param("lastName", "admin")
            .param("password", "1234") 
            .param("active", "1")         
            .param("city", "tuxtla gutierrez")
            .param("zipcode", "29010")    
            .param("telephone", "123")  
        )
            .andExpect(status().isOk())
            .andExpect(view().name("user/list"));
    }    
    
    @WithMockUser(username = "test", authorities = { "ADMIN_PRIVILEGE" })
    @Test
    public void testReportsGet() throws Exception {
        mvc.perform(get("/user/reports"))
            .andExpect(status().isOk())
            .andExpect(view().name("user/reports"));
    }
}
