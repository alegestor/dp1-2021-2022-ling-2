package org.springframework.samples.ntfh.scene;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
public class SceneServiceTest {

    @Autowired
    private SceneService sceneService;

    @Test
    public void testCountWithInitialData() {
        Integer count = sceneService.sceneCount();
        assertEquals(count, 0);
    }

}
