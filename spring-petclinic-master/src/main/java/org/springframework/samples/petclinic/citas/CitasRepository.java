/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.citas;


import org.springframework.data.repository.Repository;
import org.springframework.samples.petclinic.citas.Citas;

/**
 *
 * @author legad
 */
public interface CitasRepository extends Repository<Citas, Long>{
    void save(Citas citas);   
}
