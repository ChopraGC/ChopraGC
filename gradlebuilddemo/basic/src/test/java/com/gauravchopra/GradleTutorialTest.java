package com.gauravchopra;

import org.junit.Test;
import java.io.IOException;

public class GradleTutorialTest {

    @Test
    public void verifyNoExceptionThrown() throws IOException {
        GradleTutorial.main(new String[]{"en"});
    }

    @Test
    public void verifyNoExceptionThrownSpanish() throws IOException {
        GradleTutorial.main(new String[]{"es"});
    }
}