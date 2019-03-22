
package org.springframework.samples.petclinic.appointment;


import java.sql.Date;
import java.sql.Time;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import org.springframework.samples.petclinic.model.BaseEntity;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;


@Entity
@Table(name = "especialidades")
<<<<<<< HEAD


public class Specialties extends BaseEntity{
    @Column(name = "nombreespecialidad")
=======

public class Specialties extends BaseEntity{
    @Column(name = "nombre")
>>>>>>> 8130b4dd20b169127998bc4ae13e0d6c65647a97
    @NotEmpty
    private String nombre;
    

    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
