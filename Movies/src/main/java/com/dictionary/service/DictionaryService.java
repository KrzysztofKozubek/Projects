package com.dictionary.service;

import com.dictionary.DTO.DictionaryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.ApplicationScope;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Service
@ApplicationScope
public class DictionaryService {

    private final UserDictionaryService userDictionary;

    private final Map<String, DictionaryDTO> cachedDictionary;
    private final String[] dictionaries = new String[] {"eng", "pl"};


    @Autowired
    public DictionaryService(UserDictionaryService userDictionary) {
        cachedDictionary = loadDictionary();
        this.userDictionary = userDictionary;
    }

    public String getTranslate(String label) {
        Map<String, String> dictionary = getDictionary(userDictionary.getLanguage()).getLabelValue();
        if (dictionary.containsKey(label)) {
            return dictionary.get(label);
        }
        return label;
    }

    public String getTranslate(String language, String label) {
        Map<String, String> dictionary = getDictionary(language).getLabelValue();
        if (dictionary.containsKey(label)) {
            return dictionary.get(label);
        }
        return label;
    }

    public DictionaryDTO getDictionary() {
        return getDictionary(userDictionary.getLanguage());
    }

    public DictionaryDTO getDictionary(String language) {
        if (cachedDictionary.containsKey(language)) {
            return cachedDictionary.get(language);
        }
        return cachedDictionary.get(dictionaries[0]);
    }

    public Map<String, DictionaryDTO> getDictionaries() {
        return cachedDictionary;
    }

    private Map<String, DictionaryDTO> loadDictionary() {
         return Arrays.stream(dictionaries)
                .map(this::readDictionary)
                .collect(Collectors.toMap(DictionaryDTO::getLanguage, dic -> dic));
    }

    private DictionaryDTO readDictionary(String language) {
        try {
            Resource resource = new ClassPathResource("/dictionaries/" + language + ".properties");
            Properties props = PropertiesLoaderUtils.loadProperties(resource);
            return DictionaryDTO.builder()
                    .language(language)
                    .labelValue(new ConcurrentHashMap<>((Map) props))
                    .build();
        } catch (IOException e) {
            throw new RuntimeException("ERROR_DURING_READ_DICTIONARY");
        }
    }
}
