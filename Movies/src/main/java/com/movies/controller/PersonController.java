package com.movies.controller;

import com.movies.entity.Person;
import com.movies.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
public class PersonController {

    @Autowired
    private PersonService personService;

    @GetMapping("/person/{id}")
    public ResponseEntity<?> getMovie(@PathVariable("id") Long id) {
        return new ResponseEntity<>(personService.getPerson(id), HttpStatus.OK);
    }

//    @GetMapping("/person/find/{name}")
//    public ResponseEntity<?> getMovies(@PathVariable("name") String name) {
//        return new ResponseEntity<>(personService.getPerson(name), HttpStatus.OK);
//    }

    @PutMapping(path = "/person/", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> editMovie(@RequestBody Person person) {
        return new ResponseEntity<>(personService.editPerson(person), HttpStatus.OK);
    }

    @PostMapping(path = "/person/", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> addMovie(@RequestBody Person person) {
        return new ResponseEntity<>(personService.addPerson(person), HttpStatus.OK);
    }

    @DeleteMapping(path = "/person/{id}")
    public ResponseEntity<?> deleteMovie(@PathVariable("id") Long id) {
        return new ResponseEntity<>(personService.deletePerson(id), HttpStatus.OK);
    }
}
