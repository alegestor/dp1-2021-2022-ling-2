package org.springframework.samples.ntfh.configuration;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.samples.ntfh.exceptions.NonMatchingTokenException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

/**
 * This advice is necessary because MockMvc is not a real servlet environment,
 * therefore it does not redirect error responses to [ErrorController], which
 * produces validation response. So we need to fake it in tests. It's not ideal,
 * but at least we can use classic MockMvc tests for testing error response +
 * document it.
 */
@ControllerAdvice
public class ExceptionHandlerConfiguration extends ResponseEntityExceptionHandler {
    @Autowired
    private BasicErrorController errorController;

    private static ResponseEntity<Object> buildResponseEntity(String message, HttpStatus status) {
        Map<String, Object> body = new HashMap<>();
        body.put("message", message);
        body.put("status", +status.value() + " " + status.name());
        return new ResponseEntity<>(body, status);
    }

    @ExceptionHandler(DataAccessException.class)
    public ResponseEntity<Object> dataAccessExceptionHandler(HttpServletRequest request, DataAccessException ex) {
        // TODO return a proper error response in JSON format so the frontend can handle
        // it easily

        return buildResponseEntity(ex.getMessage(), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(NonMatchingTokenException.class)
    public ResponseEntity<Object> nonMatchingTokenExceptionHandler(HttpServletRequest request,
            NonMatchingTokenException ex) {
        return buildResponseEntity(ex.getMessage(), HttpStatus.UNAUTHORIZED);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Object> illegalArgumentExceptionHandler(HttpServletRequest request,
            IllegalArgumentException ex) {
        return buildResponseEntity("a", HttpStatus.BAD_REQUEST);
    }
    // TODO add more custom exceptions here. The structure is the same, the only
    // thing changing should be the HttpStatus
}