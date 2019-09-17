package com.bot.imdb.scheduler;

import com.bot.imdb.service.ImdbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class Imdb {

    @Autowired
    ImdbService imdb;

    @Scheduled(fixedRate = 5000)
    public void execute() throws IOException {
        imdb.save("https://www.imdb.com/title/tt1568346/");
    }
}
