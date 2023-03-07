package features;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestParallel {

    @Test
    void testParallel() {
        Results results = Runner.path("getapi").parallel(2);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}