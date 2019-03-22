package org.springframework.samples.petclinic.appointment;

import java.util.Collection;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface AppointmentRepository extends Repository<Appointment, Integer> {

    /*
    select appointment.id, user_type, date, time, pet, name specialtie, confirmation from
(select * from appointment where id_specialtie=3) as appointment
inner join specialties on appointment.id_specialtie=specialties.id;
     */

    @Query("SELECT appointment FROM Appointment appointment")
    @Transactional(readOnly = true)
    Collection<Appointment> getAppointments();

    @Query("SELECT appointment FROM Appointment appointment "
            + "WHERE appointment.especialidad=:id")
    @Transactional(readOnly = true)
    Collection<Appointment> getAppointments(@Param("id") Integer id);

    @Query("SELECT appointment FROM Appointment appointment "
            + "WHERE appointment.confirmacion =:id")
    @Transactional(readOnly = true)
    Collection<Appointment> getAppointmentsByConfirmation(@Param("id") Integer id);

    

}
