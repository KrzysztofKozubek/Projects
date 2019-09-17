package com.movies.entity.act;

import com.movies.entity.Movie;
import com.movies.entity.Role;
import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ActWithoutPerson {

    @OneToOne
    @JoinColumn(referencedColumnName = "id")
    private Movie movie;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 8)
    private Role role;

    @Column(nullable = false, length = 50)
    private String description;
}
