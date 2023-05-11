import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }
  @Test(timeout = 500)
  public void testMergeLeftEnd() {
    List<String> left = Arrays.asList("a", "b");
    List<String> right = Arrays.asList("c", "d", "e");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "b", "c", "d", "e");
    assertEquals(expected, merged);
  }
  @Test(timeout = 500)
  public void testMergeEmptyLists() {
    List<String> left = Arrays.asList();
    List<String> right = Arrays.asList();
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList();
    assertEquals(expected, merged);
}
  @Test 
	public void testIndex() throws URISyntaxException, IOException {
    Handler h = new Handler("./technical/");
    URI rootPath = new URI("http://localhost/");
    assertEquals("There are 1391 total files to search.", h.handleRequest(rootPath));
	}
	@Test 
	public void testSearch() throws URISyntaxException, IOException {
    Handler h = new Handler("./technical/");
    URI rootPath = new URI("http://localhost/search?q=Resonance");
    String expect = "Found 2 paths:\n./technical/biomed/ar615.txt\n./technical/plos/journal.pbio.0020150.txt";
    assertEquals(expect, h.handleRequest(rootPath));
	}

}
