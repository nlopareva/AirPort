package com.example.airport.models;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="airport")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "desc")
    private String description;
    @Column(name = "price")
    private int price;
    @Column(name = "from")
    private String cityFrom;
    @Column(name = "dest")
    private String cityDest;
    @Column(name = "airplane")
    private String airplane;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @Column(name = "arrival")
    private LocalDateTime arrival;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @Column(name = "departure")
    private LocalDateTime departure;
    @Column(name ="amount")
    private int amount;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,orphanRemoval = true)
    private List<Ticket> ticketList = new ArrayList<>();



    public String getFormattedArrival() {
        return arrival.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
    }
    public String getFormattedDeparture() {
        return departure.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
    }
    @Override
    public String toString() {
        return "Flight{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", cityFrom='" + cityFrom + '\'' +
                ", cityDest='" + cityDest + '\'' +
                ", airplane='" + airplane + '\'' +
                ", date='" + arrival + '\'' +
                '}';
    }


    public String getInfo() {
        return
                "$TICKET: " + cityFrom  + "->" + cityDest + ", price=" + price +
                ", airplane='" + airplane +
                ", date='" + departure ;
    }
}
