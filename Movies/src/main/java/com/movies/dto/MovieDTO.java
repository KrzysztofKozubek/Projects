package com.movies.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Size;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
public class MovieDTO {

    private Long id;

    @Size(min = 3, max = 255, message = "title movie have to be longest 3 and shortest then 255 characters")
    private String title;

    @Size(min = 1, max = 1024, message = "description movie have to be longest 1 and shortest then 1024 characters")
    private String description;

}
