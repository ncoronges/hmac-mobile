package util;

import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class HMAC {
	public static String buildHmacSignature(String pKey, String pStringToSign)
	{
	  String lSignature = "None";
	  try
	  {
	    Mac lMac = Mac.getInstance("HmacSHA256");
	    SecretKeySpec lSecret = new SecretKeySpec(pKey.getBytes(), "HmacSHA256");
	    lMac.init(lSecret);

	    byte[] lDigest = lMac.doFinal(pStringToSign.getBytes());
	    BigInteger lHash = new BigInteger(1, lDigest);
	    lSignature = lHash.toString(16);
	    if ((lSignature.length() % 2) != 0) {
	      lSignature = "0" + lSignature;
	    }
	  }
	  catch (NoSuchAlgorithmException lEx)
	  {
	    throw new RuntimeException("Problems calculating HMAC", lEx);
	  }
	  catch (InvalidKeyException lEx)
	  {
	    throw new RuntimeException("Problems calculating HMAC", lEx);
	  }

	  return lSignature;
	}
}
