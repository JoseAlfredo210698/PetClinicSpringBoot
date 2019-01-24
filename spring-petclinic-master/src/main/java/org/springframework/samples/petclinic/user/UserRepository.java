/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springframework.samples.petclinic.user;

import java.util.Collection;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.samples.petclinic.user.User;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author AugustoRuCle
 */
public interface UserRepository extends Repository<User, Integer>{
    
    @Query("SELECT user FROM User user WHERE user.email = :email")
    @Transactional(readOnly = true)
    User findByEmail(@Param("email") String email);
    
    /**
     * Save an {@link User} to the data store, either inserting or updating it.
     * @param user the {@link Owner} to save
    */
    void save(User user);
   
}
