package com.example.airport.controllers;

import com.example.airport.models.User;
import com.example.airport.services.FlyService;
import com.example.airport.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final FlyService flyService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage","Пользователь с email:"+user.getEmail()+" уже существует!");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/flight/{fId}/bought/ticket/{id}")
    public String boughtFlight(@PathVariable("id") Long id ,@PathVariable("fId") Long fId , Principal principal){
        userService.addFlight(principal, id);
        return "redirect:/flight/"+fId;
    }


    @PostMapping("/user/ticket/delete/{id}")
    public String deleteFlight(@PathVariable("id") Long id ){
        flyService.deleteTicket(id);
        return "redirect:/user";
    }

    @GetMapping("/hello")
    public String securityURL() {
        return "hello";
    }
}
