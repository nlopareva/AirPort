package com.example.airport.repositories;

import com.example.airport.models.Flight;
import com.example.airport.models.Ticket;
import com.example.airport.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TicketRepository extends JpaRepository<Ticket,Long> {

    List<Ticket> findAllByFlight(Flight flight);

    List<Ticket> findAllByUserAndFlight(User user,Flight flight);
}
