package features;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class TestParallel {

    @Test
    void testParallel() {
        Results results = Runner.path("src/test/java").parallel(10);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}