package com.example.airport.services;

import com.example.airport.models.Flight;
import com.example.airport.models.Ticket;
import com.example.airport.models.User;
import com.example.airport.models.enums.Role;
import com.example.airport.repositories.FlightRepository;
import com.example.airport.repositories.TicketRepository;
import com.example.airport.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import java.security.Principal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static com.fasterxml.jackson.databind.cfg.CoercionInputShape.Array;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final FlightRepository flightRepository;
    private final PasswordEncoder passwordEncoder;
    private final TicketRepository ticketRepository;
    private final MailSenderService mailSenderService;


    public boolean createUser(User user) {
        String userEmail = user.getEmail();
        if (userRepository.findByEmail(userEmail) != null) return false;
        user.setActive(true);
        user.getRoles().add(Role.ROLE_ADMIN);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with email: {}", userEmail);
        userRepository.save(user);
        //ОТПРАВКА ПОЧТЫ
        // mailSenderService.send(userEmail,"registration","Вы зарегистрированы в аэропорту Насти Лопаревой");
        return true;
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void addFlight(Principal principal, Long id) {
        User u = userRepository.findByEmail(principal.getName());
        List<Ticket> ticketList = ticketRepository.findAllByUserAndFlight(null, flightRepository.findById(id).orElse(null));

        Ticket t = ticketRepository.findById(id).orElse(null);
        t.setUser(u);
        ticketRepository.save(t);
        u.getTicketList().add(t);
        userRepository.save(u);
        Flight f = t.getFlight();
        f.setAmount(f.getAmount() - 1);
        flightRepository.save(f);

        //ОТПРАВКА ПОЧТЫ
        //  mailSenderService.send(u.getEmail(),"NEW TICKET","ВЫ ЗАБРОНИРОВАЛИ БИЛЕТ НА ПОЛЕТ"+f.getInfo());


    }

    public List<Ticket> getTicketsBeforeNow(User user) {
        List<Ticket> list = user.getTicketList();
        List<Ticket> result = new ArrayList<>();
        for (Ticket t : list) {
            if (isBeforeNow(t.getFlight().getDeparture())) result.add(t);
        }
        return result;

    }

    public List<Ticket> getTicketsAfterNow(User user) {
        List<Ticket> list = user.getTicketList();
        List<Ticket> result = new ArrayList<>();
        for (Ticket t : list) {
            if (isAfterNow(t.getFlight().getDeparture())) result.add(t);
        }
        return result;

    }

    private boolean isAfterNow(LocalDateTime localDateTime) {

        return localDateTime.isAfter(LocalDateTime.now());
    }

    private boolean isBeforeNow(LocalDateTime localDateTime) {

        return localDateTime.isBefore(LocalDateTime.now());
    }


    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id={}; email={}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("UNBan user with id={}; email={}", user.getId(), user.getEmail());

            }

            //ОТПРАВКА ПОЧТЫ
            // mailSenderService.send(user.getEmail(),"ban","Ваш статус  в аэропорту Насти Лопаревой временно изменен ban="+!user.isActive());

            userRepository.save(user);
        }
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}

