package com.movies.repository;

import com.movies.entity.Person;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
public interface PersonRepository extends CrudRepository <Person, Long> {

    Optional<Person> findById(Long id);

//    @Transactional(timeout = 8)
//    Optional<Set<Person>> findByNameOrSurnameContainingIgnoreCase(String name);

    Person save(Person person);
    List<Person> save(Iterable<Person> person);

    void deleteById(Long id);
}
