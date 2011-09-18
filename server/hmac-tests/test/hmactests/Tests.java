package hmactests;


import junit.framework.TestCase;

import org.junit.After;
import org.junit.Before;

import util.HMAC;

public class Tests extends TestCase {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	
	public void testBasicHMAC() throws Exception {
		String msg = "The quick brown fox jumps over the lazy dog";
		String key = "key";
		String hash = HMAC.buildHmacSignature(key, msg);
		String expectedHash = "f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8";
		assertEquals("hashes didnt match", hash, expectedHash); 
	}

}
