
package org.springframework.samples.petclinic.appointment;


import java.sql.Date;
import java.sql.Time;
import javax.persistence.Basic;
import javax.persistence.Column;
import org.springframework.samples.petclinic.model.BaseEntity;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;


@Entity
@Table(name = "especialidades")

public class Specialties extends BaseEntity{
    @Column(name = "nombre")
    @NotEmpty
    private String name;

    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
}
