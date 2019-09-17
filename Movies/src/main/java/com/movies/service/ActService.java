package com.movies.service;

import com.dictionary.service.DictionaryService;
import com.movies.entity.Act;
import com.movies.entity.Movie;
import com.movies.entity.Person;
import com.movies.entity.Role;
import com.movies.entity.act.ActWithoutMovie;
import com.movies.entity.act.ActWithoutPerson;
import com.movies.repository.ActRepository;
import com.movies.repository.MoviesRepository;
import com.movies.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActService {

    @Autowired
    private ActRepository actRepository;

    @Autowired
    private DictionaryService dictionaryService;

    public Act addAct(Act act) {
        return actRepository.save(act);
    }

    public List<ActWithoutMovie> getMovies(Long id) {
        return actRepository.findByMovieId(id);
    }

    public List<ActWithoutPerson> getPersons(Long id) {
        return actRepository.findByPersonId(id);
    }
}
