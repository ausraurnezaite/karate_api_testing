package features;


import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testGet() {
        return Karate.run("getapi").relativeTo(getClass());
    }

    @Karate.Test
    Karate testDelete() {
        return Karate.run("deleteapi").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("getapi").tags("@positive").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTagsWithoutFeatureName() {
        return Karate.run().tags("@positive").relativeTo(getClass());
    }

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}