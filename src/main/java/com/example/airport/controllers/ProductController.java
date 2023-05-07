package com.example.airport.controllers;

import com.example.airport.models.Flight;
import com.example.airport.models.User;
import com.example.airport.services.FlyService;
import com.example.airport.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final FlyService flyService;
    private final UserService userService;

    @GetMapping("/search")
    public String products(@RequestParam(name = "destination", required = false) String destination, @RequestParam(name = "departure", required = false) String departure,Principal principal,Model model) {
        List<Flight> flightList = flyService.getFlightList(destination,departure);
        boolean founded = true;//ect'
        if(flightList.size()==0) {flightList = flyService.getFlightList(null,null);
            founded = false;//net podhod'asch'ego
        }
        model.addAttribute("flights", flightList);
        model.addAttribute("founded", founded);
        model.addAttribute("user",flyService.getUserByPrincipal(principal));
        model.addAttribute("dest",destination);
        model.addAttribute("dep",departure);
        return "flights";
    }

    @GetMapping("/search/all")
    public String productsAll(Principal principal,Model model) {

        model.addAttribute("flights", flyService.getFlightList(null,null));
        model.addAttribute("founded", true);
        model.addAttribute("user",flyService.getUserByPrincipal(principal));
        model.addAttribute("dest","");
        model.addAttribute("dep","");
        return "flights";
    }


    @GetMapping("/")
    public String products( Principal principal,Model model) {
        model.addAttribute("user",flyService.getUserByPrincipal(principal));
        return "main";
    }
    @GetMapping("/flight/{id}")
    public String flightInfo(@PathVariable Long id, Model model){
       model.addAttribute("flight", flyService.getFlightById(id));
        return "flight-info";
    }



    @GetMapping("/user")
    public String userInfo(Principal principal, Model model){
        model.addAttribute("user",flyService.getUserByPrincipal(principal));
        model.addAttribute("nextFlights",userService.getTicketsAfterNow(flyService.getUserByPrincipal(principal)));
        model.addAttribute("previousFlights",userService.getTicketsBeforeNow(flyService.getUserByPrincipal(principal)));
        return "user-info";
    }

}
