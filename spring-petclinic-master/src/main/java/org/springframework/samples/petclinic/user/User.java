/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.user;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PropertyComparator;
import org.springframework.core.style.ToStringCreator;
import org.springframework.samples.petclinic.model.Person;
 
/**
 *
 * @author AugustoRuCle
 */

@Entity
@Table(name = "users")

public class User extends Person {
    @Column(name = "identifier")
    @NotEmpty
    @NotNull
    @Size(min=2, max=30)
    private String identifier;

    @Column(name = "active")
    @NotEmpty
    @NotNull
    @Size(min=1, max=1)
    private String active;

    @Column(name = "zipcode")
    @NotEmpty
    @NotNull
    @Size(min=5, max=10)
    private String zipcode; 
    
    public String getIdentifier() {
        return this.identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
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

}
