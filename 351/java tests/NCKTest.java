import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class NCKTest {

    @Before
    public void before() {
    set(v0, 1337);
    }

    /******************************************************************
     *
     * Test makes10
     *
     *****************************************************************/

    @Test 
    public void nCk_5_3() {
    run("nCk", 5, 3);
    Assert.assertEquals(10, get(v0));
    }
    @Test 
    public void nCk_100_4() {
    run("nCk", 100, 4);
    Assert.assertEquals(3921225, get(v0));
    }
    //pass
    @Test 
    public void nCk_5_0() {
    run("nCk", 5, 0);
    Assert.assertEquals(1, get(v0));
    }
    //pass
    @Test 
    public void nCk_0_5() {
    run("nCk", 0, 5);
    Assert.assertEquals(-1, get(v0));
    }
    
    @Test 
    public void nCk_5_1() {
    run("nCk", 5, 1);
    Assert.assertEquals(5, get(v0));
    }
    //passs
    @Test 
    public void nCk_5_5() {
    run("nCk", 5, 5);
    Assert.assertEquals(1, get(v0));
    }
    @Test 
    public void nCk_11_3() {
    run("nCk", 11, 3);
    Assert.assertEquals(165, get(v0));
    }
    @Test 
    public void nCk_10_4() {
    run("nCk", 10, 4);
    Assert.assertEquals(210, get(v0));
    }
    @Test 
    public void nCk_0_0() {
    run("nCk", 0, 0);
    Assert.assertEquals(1, get(v0));
    }

    /******************************************************************
     *
     * Write many more tests!  * Test Edge Cases *
     *
     *****************************************************************/
    
} // end class


