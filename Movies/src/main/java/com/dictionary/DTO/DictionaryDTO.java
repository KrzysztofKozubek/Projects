package com.dictionary.DTO;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.NonNull;

import java.util.Map;

@Builder
@Getter
@Setter
public class DictionaryDTO {

    @NonNull
    private final String language;

    @NonNull
    private final Map<String, String> labelValue;
}
