package com.movies.repository;

import com.movies.entity.Act;
import com.movies.entity.act.ActWithoutMovie;
import com.movies.entity.act.ActWithoutPerson;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ActRepository extends CrudRepository <Act, Long> {

    Optional<Act> findById(Long id);

    Act save(Act act);

    @Query("SELECT new com.movies.entity.act.ActWithoutMovie(a.person, a.role, a.description) FROM Act a " +
            "WHERE a.movie.id = :id")
    List<ActWithoutMovie> findByMovieId(@Param("id") Long id);
    @Query("SELECT new com.movies.entity.act.ActWithoutPerson(a.movie, a.role, a.description) FROM Act a " +
            "WHERE a.person.id = :id")
    List<ActWithoutPerson> findByPersonId(@Param("id") Long id);
}
