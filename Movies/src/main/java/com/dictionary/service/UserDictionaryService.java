package com.dictionary.service;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

@Service
@SessionScope
public class UserDictionaryService {

    private String choosenLanguage = "eng";

    public String getLanguage() {
        return choosenLanguage;
    }

    public String setLanguage(String language) {
        choosenLanguage = language;
        return language;
    }
}
