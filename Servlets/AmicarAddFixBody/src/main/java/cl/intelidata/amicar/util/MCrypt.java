package cl.intelidata.amicar.util;

/**
 * MCrypt class Created by Maze on 04-03-2015.
 */
public class MCrypt {

	private javax.crypto.spec.IvParameterSpec ivspec;
	private javax.crypto.spec.SecretKeySpec   keyspec;
	private javax.crypto.Cipher               cipher;

	/**
	 *
	 */
	public MCrypt() {
		this.ivspec = new javax.crypto.spec.IvParameterSpec(Texto.IV.getBytes());

		this.keyspec = new javax.crypto.spec.SecretKeySpec(Texto.KEY.getBytes(), "AES");

		try {
			this.cipher = javax.crypto.Cipher.getInstance("AES/CBC/NoPadding");
		} catch (java.security.NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (javax.crypto.NoSuchPaddingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param data byte[]
	 *
	 * @return String
	 */
	public static String bytesToHex(byte[] data) {
		if (data == null) {
			return null;
		}

		int len = data.length;
		String str = "";
		for (int i = 0; i < len; i++) {
			if ((data[i] & 0xFF) < 16) {
				str = str + "0" + java.lang.Integer.toHexString(data[i] & 0xFF);
			} else {
				str = str + java.lang.Integer.toHexString(data[i] & 0xFF);
			}
		}
		return str;
	}

	/**
	 * @param text String
	 *
	 * @return byte[]
	 *
	 * @throws Exception
	 */
	public byte[] encrypt(String text) throws Exception {
		if (text == null || text.length() == 0) {
			throw new Exception("Empty string");
		}

		byte[] encrypted;

		try {
			this.getCipher().init(javax.crypto.Cipher.ENCRYPT_MODE, this.getKeyspec(), this.getIvspec());

			encrypted = this.getCipher().doFinal(padString(text).getBytes());
		} catch (Exception e) {
			throw new Exception("[encrypt] " + e.getMessage());
		}

		return encrypted;
	}

	/**
	 * @return javax.crypto.Cipher
	 */
	public javax.crypto.Cipher getCipher() {
		return cipher;
	}

	/**
	 * @return javax.crypto.spec.SecretKeySpec
	 */
	public javax.crypto.spec.SecretKeySpec getKeyspec() {
		return keyspec;
	}

	/**
	 * @return javax.crypto.spec.IvParameterSpec
	 */
	public javax.crypto.spec.IvParameterSpec getIvspec() {
		return ivspec;
	}

	/**
	 * @param source String
	 *
	 * @return String
	 */
	private static String padString(String source) {
		char paddingChar = ' ';
		int size = 16;
		int x = source.length() % size;
		int padLength = size - x;

		for (int i = 0; i < padLength; i++) {
			source += paddingChar;
		}

		return source;
	}

	/**
	 * @param ivspec javax.crypto.spec.IvParameterSpec
	 */
	public void setIvspec(javax.crypto.spec.IvParameterSpec ivspec) {
		this.ivspec = ivspec;
	}

	/**
	 * @param keyspec javax.crypto.spec.SecretKeySpec
	 */
	public void setKeyspec(javax.crypto.spec.SecretKeySpec keyspec) {
		this.keyspec = keyspec;
	}

	/**
	 * @param cipher javax.crypto.Cipher
	 */
	public void setCipher(javax.crypto.Cipher cipher) {
		this.cipher = cipher;
	}

	/**
	 * @param code String
	 *
	 * @return byte[]
	 *
	 * @throws Exception
	 */
	public byte[] decrypt(String code) throws Exception {
		if (code == null || code.length() == 0) {
			throw new Exception("Empty string");
		}

		byte[] decrypted;

		try {
			this.getCipher().init(javax.crypto.Cipher.DECRYPT_MODE, this.getKeyspec(), this.getIvspec());

			decrypted = this.getCipher().doFinal(hexToBytes(code));
		} catch (Exception e) {
			throw new Exception("[decrypt] " + e.getMessage());
		}
		return decrypted;
	}

	/**
	 * @param str String
	 *
	 * @return byte[]
	 */
	public static byte[] hexToBytes(String str) {
		if (str == null) {
			return null;
		} else if (str.length() < 2) {
			return null;
		} else {
			int len = str.length() / 2;
			byte[] buffer = new byte[len];
			for (int i = 0; i < len; i++) {
				buffer[i] = (byte)Integer.parseInt(str.substring(i * 2, i * 2 + 2), 16);
			}
			return buffer;
		}
	}
}
