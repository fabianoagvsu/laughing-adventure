import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class LoopsTest {


    /******************************************************************
     *
     * Test indexOf
     *
     ******************************************************************/

    Label array1 = wordData(5, 4, 7, 6, 9, 8, 2, 1, -1);
    Label array2 = wordData(33, 14, 0, 50, 29, -1);

    @Test
    public void indexOf_findsValueOccurringOnceOnly() {
	run("indexOf", 2, array1);
	Assert.assertEquals(6, get(v0));
    }

    @Test
    public void indexOf_returns_neg1_ifNotFound() {
	run("indexOf", 3, array1);
	Assert.assertEquals(-1, get(v0));
    }
    
    @Test
    public void indexOf_returns_neg2_ifNotFound() {
	run("indexOf", 1, array1);
	Assert.assertEquals(7, get(v0));
    }
	
    @Test
    public void indexOf_returns_neg1() {
	run("indexOf", 3, array1);
	Assert.assertEquals(-1, get(v0));
    }
    
      @Test
    public void indexOf_beginning() {
	run("indexOf", 5, array1);
	Assert.assertEquals(0, get(v0));
	}
    //Label array2 = wordData(33, 14, 0, 50, 29, -1);
	  @Test
    public void indexOf_findsValueOccurringOnceOnly_array2() {
	run("indexOf", 33, array2);
	Assert.assertEquals(0, get(v0));
    }

    @Test
    public void indexOf_returns_neg1_ifNotFound_array2() {
	run("indexOf", 0, array2);
	Assert.assertEquals(2, get(v0));
    }
    
    @Test
    public void indexOf_returns_neg2_ifNotFound_array2() {
	run("indexOf", 29, array2);
	Assert.assertEquals(4, get(v0));
    }
	
    @Test
    public void indexOf_returns_neg1_array2() {
	run("indexOf", 13, array2);
	Assert.assertEquals(-1, get(v0));
    }
    
      @Test
    public void indexOf_beginning_array2() {
	run("indexOf", 14, array2);
	Assert.assertEquals(1, get(v0));
	}
    // Write more tests.  Your tests shouldn't all use array1.

    /******************************************************************
     *
     * Test max
     *
     ******************************************************************/
     
     Label array3 = wordData(-5, -7, -9, -30);
     Label array4 = wordData(9);
    @Test
    public void max_findsMaximum() {
	run("max", array1, 9);
	Assert.assertEquals(9, get(v0));
    }
    
    @Test
    public void max_findsMaximuminarray2() {
	run("max", array4, 1);
	Assert.assertEquals(9, get(v0));
    }
    
        @Test
    public void max_findsMaximuminarray3() {
	run("max", array3, 4);
	Assert.assertEquals(-5, get(v0));
    }
    // Write **a lot** more tests.
    // Write **a lot** more tests.


    /******************************************************************
     *
     * Test sum13
     *
     ******************************************************************/

    Label sum13_array1 = wordData(1, 2, 2, 1);
    Label sum13_array2 = wordData(1, 2, 13, 2, 1, 13);

    @Test
    public void sum13_sumsAllIfNo13() {
	run("sum13", sum13_array1, 4);
	Assert.assertEquals(6, get(v0));
    }

    @Test
    public void sum13_ignore13_andFollowing() {
	run("sum13", sum13_array2, 6);
	Assert.assertEquals(4, get(v0));
    }

    // Write **a lot** more tests.

    /******************************************************************
     *
     * Test sum67
     *
     ******************************************************************/

    Label sum67_array1 = wordData(14, 6, 2, 3, 4, 7, 9, 10);

    @Test
    public void sum67_handlesOneRun() {
	run("sum67", sum67_array1, 8);
	Assert.assertEquals(33, get(v0));
    }
    // Write **a lot** more tests

}
