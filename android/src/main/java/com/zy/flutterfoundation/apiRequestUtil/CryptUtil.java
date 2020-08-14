package com.zy.flutterfoundation.apiRequestUtil;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


public class CryptUtil {
    private CryptUtil() {
    }

    /**
     * //	    String encryptA="Ii6FhSlwX5JTvz2ESJZAew==";
     //	    String encryptSafe=CryptUtil.urlsafe_b64encode(encryptA);
     //	    logger.debug("safe 64:"+encryptSafe ); ;
     //
     //	    String encryptNOSafe=CryptUtil.urlsafe_b64decode(encryptA);
     //	    logger.debug("no safe 64:"+encryptNOSafe ); ;
     //
     //	    String decrypt=CryptUtil.decrypt(encryptNOSafe);
     //	    logger.debug("decrypt:"+decrypt ); ;
     //	    logger.debug("decrypt:"+ CryptUtil.encrypt(decrypt)); ;
     */

    /**
     * 网址安全转码
     *
     * @param str
     * @return
     */
    public static String urlsafe_b64encode(String str) {
        return str.replace("=", "").replace("+", "-").replace("/", "_");
    }

    /**
     * 网址安全解码
     *
     * @param str
     * @return
     */

    public static String urlsafe_b64decode(String str) {
        String copyStr = str.replace("-", "+").replace("_", "/");
        int mod = copyStr.length() % 4;
        String appendStr = "====";
        return copyStr.concat(appendStr.substring(0, mod));
    }

    /**
     * 加密
     *
     * @param data
     * @return
     */
    public static String encrypt(String data, String key) {
        String md5Code = MD5(key).toLowerCase();
        String aesKey = md5Code.substring(0, 16);
        String aesIVKey = md5Code.substring(16);
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            int blockSize = cipher.getBlockSize();

            byte[] dataBytes = data.getBytes("utf-8");
            int plaintextLength = dataBytes.length;
            if (plaintextLength % blockSize != 0) {
                plaintextLength = plaintextLength + (blockSize - (plaintextLength % blockSize));
            }

            byte[] plaintext = new byte[plaintextLength];
            System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);

            SecretKeySpec keyspec = new SecretKeySpec(aesKey.getBytes(), "AES");
            IvParameterSpec ivspec = new IvParameterSpec(aesIVKey.getBytes());

            cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);
            byte[] encrypted = cipher.doFinal(plaintext);

            return Base64.encode(encrypted);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    /**
     * 解密
     *
     * @param data
     * @return
     */
    public static String decrypt(String data, String key) {
        String md5Code = MD5(key).toLowerCase();
        String aesKey = md5Code.substring(0, 16);
        String aesIVKey = md5Code.substring(16);
        try {
            byte[] by = Base64.decode(data);
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            SecretKeySpec keyspec = new SecretKeySpec(aesKey.getBytes(), "AES");
            IvParameterSpec ivspec = new IvParameterSpec(aesIVKey.getBytes());

            cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);

            byte[] original = cipher.doFinal(by);
            String originalString = new String(original, "utf-8");
            return originalString.trim();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    /**
     * 密码加密MD5(MD5(123456+密码KEY)+密码KEY)
     *
     * @param psw 明文
     * @return 密文
     */
    public static String encryptPsw(String psw, String key) {
        return MD5(MD5(psw + key).toUpperCase() + key).toUpperCase();
    }

    /**
     * 请求签名验证
     *
     * @param encrypt
     * @param expand
     * @return
     */
    public static String requestSignValidator(String encrypt, String expand, String key) {
        return MD5(encrypt + "&" + expand + "&" + key);
    }

    /**
     * 增强MD5数据
     *
     * @return
     */
    public static String enhanceMD5(String strMD5) {
        String time = MD5(new Date().getTime() + "");
        return strMD5.substring(0, 10) + time.substring(0, 5)
                + strMD5.substring(10, 20) + time.substring(5, 10)
                + strMD5.substring(20, 30) + time.substring(10, 15)
                + strMD5.substring(30);
    }

    /**
     * 生成签名.
     *
     * @param data 待签名数据
     * @param key  密钥
     * @return 签名
     */
    public static String generateSignature(final Map<String, Object> data, String key) {
        Set<String> keySet = data.keySet();
        String[] keyArray = keySet.toArray(new String[keySet.size()]);
        Arrays.sort(keyArray);
        StringBuilder sb = new StringBuilder();
        for (String k : keyArray) {
            if (k.toLowerCase().equals("sign"))
                continue;
            if (data.get(k).toString().trim().length() > 0) // 参数值为空，则不参与签名
                sb.append(k).append("=").append(data.get(k).toString().trim()).append("&");
        }
        sb.append("key=").append(key);
        try {
            return MD5(sb.toString()).toUpperCase();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }

    /**
     * MD5加密
     *
     * @param s
     * @return
     */

    public static final String MD5(String s) {
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            byte[] btInput = s.getBytes();
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            mdInst.update(btInput);
            byte[] md = mdInst.digest();
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    /**
     * 用SHA1算法生成安全签名
     *
     * @param token     票据
     * @param timestamp 时间戳
     * @param nonce     随机字符串
     * @param encrypt   密文
     * @return 安全签名
     */
    public static String getSHA1(String token, String timestamp, String nonce, String encrypt) {
        String[] array = new String[]{token, timestamp, nonce, encrypt};
        StringBuffer sb = new StringBuffer();
        // 字符串排序
        Arrays.sort(array);
        for (int i = 0; i < 4; i++) {
            sb.append(array[i]);
        }
        String str = sb.toString();
        // SHA1签名生成
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-1");
            md.update(str.getBytes());
            byte[] digest = md.digest();

            StringBuffer hexstr = new StringBuffer();
            String shaHex = "";
            for (int i = 0; i < digest.length; i++) {
                shaHex = Integer.toHexString(digest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexstr.append(0);
                }
                hexstr.append(shaHex);
            }
            return hexstr.toString();
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }

    }


}
