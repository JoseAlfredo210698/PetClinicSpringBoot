
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
@Table(name = "citas")

public class AppointmentReport extends BaseEntity{
    @Column(name = "owner_id")
    @NotEmpty
    private Integer owner_id;

    @Column(name = "fecha")
    @Basic
    @NotEmpty
    private Date fecha;

    @Column(name = "hora")
    @Basic
    @NotEmpty
    private Time hora;
    
    @Column(name = "mascota")
    @NotEmpty
    private String mascota;
    
    @Column(name = "especialidad")
    @NotEmpty
    private String especialidad;
    
    @Column(name = "confirmacion")
    @NotEmpty
    @NotNull
    @Positive
    private Integer confirmacion;
    
    

    
    
    public Integer getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(Integer owner_id) {
        this.owner_id = owner_id;
    }
    
    
    public Date getFecha() {
        return fecha;
    }
    
    public void setFecha(Date date) {
        this.fecha = date;
    }
    

    
    public void setHora(Time hora) {
        this.hora = hora;
    }
    
    public Time getHora() {
        return hora;
    }
    
    public String getMascota() {
        return mascota;
    }
    
    public void setMascota(String pet) {
        this.mascota = pet;
    }
    
    public String getEspecialidad() {
        return especialidad;
    }
    
    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    
    public Integer getConfirmacion() {
        return confirmacion;
    }
    
    public void setConfirmacion(Integer confirmacion) {
        this.confirmacion = confirmacion;
    }


    
    
}
