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
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"movie_id", "person_id", "role", "description"}))
public class Act {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;

    @OneToOne
    @JoinColumn(referencedColumnName = "id")
    private Movie movie;

    @OneToOne
    @JoinColumn(referencedColumnName = "id")
    private Person person;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 8)
    private Role role;

    @Column(nullable = false, length = 50)
    private String description;
}

