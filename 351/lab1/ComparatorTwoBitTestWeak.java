import org.junit.Assert;
import org.junit.Test;

import static edu.gvsu.dlunit.DLUnit.*;

/**
 * Sample test cases for an unsigned, 2-bit comparator.
 *
 * IMPORTANT:  These test cases do *not* thoroughly test the comparator.
 * You need to rename this class and add more tests!
 *
 * Written by Nathan Bowman, 1/20/2021
 */
public class ComparatorTwoBitTestStrong {

  /* Note: it is generally considered bad form to put several tests into a
   * single method. However, for purposes of this assignment, I suggest
   * you do not bother making 16 different methods and instead find a simpler
   * way.
   *
   * You can feel free to remove the existing tests as well.
   * if i is less than j, assert equals 1.
   * if i is greater than or equal to j, assert equals 0.
   */

  /*@Test
  public void zero_zero() {
    setPinUnsigned("InputA", 0);
    setPinUnsigned("InputB", 0);
    run();
    Assert.assertEquals(0, readPinUnsigned("Output"));
  }*/
  
  @Test
  public void loopTest() {
	setPinUnsigned("InputA", 0);
	setPinUnsigned("InputB", 0);
	for (int i = 1; i < 4; i++) {
		for (int j = 1; j < 4; j++) {	
			run();
			if (i < j) {
				Assert.assertEquals(1, readPinUnsigned("Output"));
			} else {
				Assert.assertEquals(0, readPinUnsigned("Output"));
			}
			setPinUnsigned("InputB", j);		
		}
		setPinUnsigned("InputB", 0);
		setPinUnsigned("InputA", i);
	}
  }
}
