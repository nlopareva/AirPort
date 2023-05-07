package com.example.airport.repositories;

import com.example.airport.models.Ticket;
import com.example.airport.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

}
