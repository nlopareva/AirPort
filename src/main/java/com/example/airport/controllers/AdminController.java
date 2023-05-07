package com.example.airport.controllers;

import com.example.airport.models.Flight;
import com.example.airport.models.User;
import com.example.airport.models.enums.Role;
import com.example.airport.services.FlyService;
import com.example.airport.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final FlyService flyService;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal) {
        model.addAttribute("admin", flyService.getUserByPrincipal(principal));
        model.addAttribute("users", userService.list());
        model.addAttribute("flights", flyService.getFlightList(null, null));
        model.addAttribute("statistics", flyService.statistics());

        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @GetMapping("/admin/flight/info/{id}")
    public String userEdit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("flight", flyService.getFlightById(id));
        model.addAttribute("tickets", flyService.getFlightById(id).getTicketList());
        return "admin_flight_info";
    }


    @GetMapping("/admin/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        return "admin_user_info";
    }


    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";

    }

    @PostMapping("/flight/create")
    public String createFlight(Flight flight, Principal principal) {
        System.out.println("CREATE");
        flyService.saveFlight(principal, flight);
        return "redirect:/admin";
    }
    @PostMapping("/admin/flight/{fId}/ticket/delete/{id}")
    public String deleteTicket(@PathVariable("id") Long id,@PathVariable("fId") Long fId ){
        flyService.deleteTicket(id);
        return "redirect:/admin/flight/info/"+fId;
    }


    @PostMapping("/admin/flight/delete/{id}")
    public String deleteFlight(@PathVariable("id") Long id) {
        flyService.deleteFlight(id);
        return "redirect:/admin";
    }
}
