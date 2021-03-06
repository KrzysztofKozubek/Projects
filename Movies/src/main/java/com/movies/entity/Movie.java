package com.movies.entity;

import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Data
@Setter
@Entity
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;

    @Column(unique = false, nullable = false)
    private String poster;

    @Column(unique = false, nullable = false)
    private String title;

    @Column(unique = false, nullable = false)
    private String description;

    @Column(unique = false, nullable = true)
    private String trailer;
}
