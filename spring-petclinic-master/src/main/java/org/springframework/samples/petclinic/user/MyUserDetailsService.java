///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
package org.springframework.samples.petclinic.user;
//
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.DelegatingPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
//
///**
// *
// * @author katZ_
// */
//@Service("userDetailsService")
//@Transactional
//public class MyUserDetailsService implements UserDetailsService {
// 
//    @Autowired
//    private UserRepository userRepository;    
//  
//    @Autowired
//    private RoleRepository roleRepository;
// 
//    @Override
//    public UserDetails loadUserByUsername(String email)
//            throws UsernameNotFoundException {
//  
//        User user = userRepository.findByEmail(email);
//        if (user == null) {
//            return new org.springframework.security.core.userdetails.User(
//              " ", " ", true, true, true, true, 
//              getAuthorities(Arrays.asList(
//                roleRepository.findByName("ROLE_USER"))));
//        }
//        
//        System.out.println("Estoy en mis service:" + user.toString());
//        
//        return new org.springframework.security.core.userdetails.User(
//          user.getEmail(), user.getPassword(), user.isEnabled(), true, true, 
//          true, getAuthorities(user.getRoles()));
//    }
//    
//    private Collection<? extends GrantedAuthority> getAuthorities(
//      Collection<Role> roles) {
//  
//        return getGrantedAuthorities(getPrivileges(roles));
//    }
// 
//    private List<String> getPrivileges(Collection<Role> roles) {
//  
//        List<String> privileges = new ArrayList<>();
//        List<Privilege> collection = new ArrayList<>();
//        for (Role role : roles) {
//            collection.addAll(role.getPrivileges());
//        }
//        for (Privilege item : collection) {
//            privileges.add(item.getName());
//        }
//        return privileges;
//    }
// 
//    private List<GrantedAuthority> getGrantedAuthorities(List<String> privileges) {
//        List<GrantedAuthority> authorities = new ArrayList<>();
//        for (String privilege : privileges) {
//            authorities.add(new SimpleGrantedAuthority(privilege));
//        }
//        return authorities;
//    }
//}

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
@Transactional
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HttpServletRequest request;

    public MyUserDetailsService() {
        super();
    }

    // API

    @Override
    public UserDetails loadUserByUsername(final String email) throws UsernameNotFoundException {

        try {
            final User user = userRepository.findByEmail(email);
            if (user == null) {
                throw new UsernameNotFoundException("No user found with username: " + email);
            }
            
            System.out.println("Estoy en mis service:" + getAuthorities(user.getRoles()));
            return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), user.isEnabled(), true, true, true, getAuthorities(user.getRoles()));
        } catch (final Exception e) {
            throw new RuntimeException(e);
        }
    }

    // UTIL

    private final Collection<? extends GrantedAuthority> getAuthorities(final Collection<Role> roles) {
        System.out.println("Adentro de grranted: " + roles.toString());
        return getGrantedAuthorities(getPrivileges(roles));
    }

    private final List<String> getPrivileges(final Collection<Role> roles) {
        System.out.println("adentro de privileges: " + roles.toString());
        List<String> privileges = new ArrayList<String>();
        List<Privilege> collection = new ArrayList<Privilege>();
        for (Role role : roles) {
            System.out.println( "que hay adentro de rol: " + role.getPrivileges().toString());
            collection.addAll(role.getPrivileges());
        }
        for (Privilege item : collection) {
            privileges.add(item.getName());
        }

        return privileges;
    }

    private final List<GrantedAuthority> getGrantedAuthorities(final List<String> privileges) {
        final List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (final String privilege : privileges) {
            authorities.add(new SimpleGrantedAuthority(privilege));
        }
        return authorities;
    }

    private final String getClientIP() {
        final String xfHeader = request.getHeader("X-Forwarded-For");
        if (xfHeader == null) {
            return request.getRemoteAddr();
        }
        return xfHeader.split(",")[0];
    }

}