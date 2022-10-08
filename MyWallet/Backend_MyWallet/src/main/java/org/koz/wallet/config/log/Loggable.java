package org.koz.wallet.config.log;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public interface Loggable {

    default Logger logger() {
        return LogManager.getLogger(this.getClass().getName());
    }

    default void logMessage(String baseMessage, Map<String, String> parameterMap) {
        List<String> log = parameterMap
                .entrySet()
                .stream()
                .map(item -> item.getKey() + ": {"+  item.getValue() + "}").collect(Collectors.toList());
        String loggerMessage = baseMessage + "; " + String.join(", ", log);
        logger().info(loggerMessage);
    }
}