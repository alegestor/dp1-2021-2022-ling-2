package org.springframework.samples.ntfh.card;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
public class CardServiceTest {

    @Autowired
    private CardService cardService;

    @Test
    public void testCountWithInitialData() {
        Integer count = cardService.cardCount();
        assertEquals(count, 0);
    }
    
}
