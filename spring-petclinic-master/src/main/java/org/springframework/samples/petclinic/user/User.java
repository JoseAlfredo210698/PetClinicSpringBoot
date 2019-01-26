/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.user;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PropertyComparator;
import org.springframework.core.style.ToStringCreator;
import org.springframework.samples.petclinic.model.BaseEntity;
import org.springframework.samples.petclinic.model.Person;
 
/**
 *
 * @author AugustoRuCle
 */

@Entity
@Table(name = "users")

public class User extends Person{

    @Column(name = "email")
    @NotEmpty
    private String email;
    
    @Column(name = "password")
    @NotEmpty
    private String password;

    @Column(name = "telephone")
    @Size(min=0, max=10)
    private String telephone;
    
    @Column(name = "active")
    @NotEmpty
    @Max(1)
    private String active;

    @Column(name = "zipcode")
    @NotEmpty
    @Size(min=5, max=10)
    private String zipcode; 
 
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }    
    
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getTelephone() {
        return this.telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getActive() {
        return this.active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getZipcode() {
        return this.zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
    
    @Override
    public String toString() {
        return new ToStringCreator(this)
            .append("id", this.getId()).append("new", this.isNew())
            .append("lastName", this.getLastName())
            .append("firstName", this.getFirstName())
            .append("email", this.getEmail())
            .append("active", this.getActive())
            .append("password", this.getPassword())
            .append("zipcode", this.getZipcode())
            .append("telephone", this.getTelephone())
            .toString();
    }

}
