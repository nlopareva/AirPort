package com.example.airport.repositories;

import com.example.airport.models.Flight;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FlightRepository extends JpaRepository<Flight,Long> {

    List<Flight> findByDescription(String description);
    List<Flight> findByCityDestAndCityFrom(String destination, String departure);
    List<Flight> findByCityDest(String destination);
    List<Flight> findByCityFrom(String departure);
}
