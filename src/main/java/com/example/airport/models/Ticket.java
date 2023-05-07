package com.example.airport.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name="tickets")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "place")
    private int place;

    @ManyToOne(fetch = FetchType.LAZY)
    private Flight flight;
    @ManyToOne(fetch = FetchType.LAZY)
    private User user;



}
