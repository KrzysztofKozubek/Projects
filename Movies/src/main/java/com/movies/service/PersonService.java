package com.movies.service;

import com.dictionary.service.DictionaryService;
import com.movies.entity.Person;
import com.movies.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class PersonService {

    @Autowired
    private PersonRepository personRepository;

    @Autowired
    private DictionaryService dictionaryService;

    public Person getPerson(Long id) throws IllegalArgumentException {
        return personRepository
                .findById(id)
                .orElseThrow(() -> new IllegalArgumentException("PERSON_INCORRECT_ID"));
    }

//    public Set<Person> getPerson(String nameOrSurname) throws IllegalArgumentException {
//        return personRepository.findByNameOrSurnameContainingIgnoreCase(nameOrSurname)
//                .orElseThrow(() ->  new IllegalArgumentException("PERSON_NO_RESULT")
//        );
//    }

    public Person addPerson(Person person) {
        return personRepository.save(person);
    }

    public List<Person> addPerson(List<Person> persons) {
        return persons.stream()
                .map(person -> personRepository.save(person))
                .collect(Collectors.toList());
    }

    public Person editPerson(Person person) {
        return personRepository.save(person);
    }

    public String deletePerson(Long id) {
        personRepository.deleteById(id);
        return dictionaryService.getTranslate("PERSON_SUCCESSFUL_REMOVED");
    }
}
