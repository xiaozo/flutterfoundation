package com.zy.flutterfoundation.apiRequestUtil;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.text.TextUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zy.flutterfoundation.FlutterfoundationPlugin;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import io.flutter.plugin.common.PluginRegistry;

public class HttpEncryptTool {
    public static Map<String, Object> encodingJsonNetworkDataWithFunction(
            String function,
            String systemRequesId,
            String networkRequestAPiKey,
            String systemNetworkAesKey,
            String userId,
            Map<String, Object> inputData,
            Map<String, Object> expand
    ) {
        Map<String, Object> body = new HashMap<>();
        String encryptString = "";
        String expandJsonString = "";
        String signStr = "";

        Context mContext = FlutterfoundationPlugin.mContext;
        long nowTimestamp = System.currentTimeMillis() / 1000;
        String userToken = "";

        // 获取visionNum
        String visionName = getVersionName(mContext);
        String[] visions = visionName.split("\\.");
        int visionNum = Integer.valueOf(visions[0]) * 10000 + Integer.valueOf(visions[1]) * 100 + Integer.valueOf(visions[2]);

        // 在设备首次启动时，系统会随机生成一个64位的数字，并把这个数字以16进制字符串的形式保存下来，这个16进制的字符串就是ANDROID_ID，当设备被恢复出厂设置后该值会被重置。
//        String ANDROID_ID = Settings.System.getString(HiApplication.instance.getContentResolver(), Settings.System.ANDROID_ID);
//        TelephonyManager tm = (TelephonyManager) mContext.getSystemService(Context.TELEPHONY_SERVICE);
//        @SuppressLint("MissingPermission") String imei = tm.getDeviceId();

        String ANDROID_ID = getUniqueID(mContext);
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        String uniqueDataString = userId
                + "|"
                + visionNum
                + "|"
                + nowTimestamp
                + "|"
                + ANDROID_ID
                + "|"
                + systemRequesId
                + "|"
                + uuid;

        Map<String, Object> encryptDataMap = new HashMap<>();
        encryptDataMap.put("function", function);
        encryptDataMap.put("api_version", 10000);
        encryptDataMap.put("unique_data", uniqueDataString);
        encryptDataMap.put("token", userToken);
        encryptDataMap.put("appVersion", visionNum);
        encryptDataMap.put("systemNumber", systemRequesId);
        encryptDataMap.put("input_data", inputData);

        Gson gson = new GsonBuilder().create();
        //加密数据源map转json字符串
        String encryptJsonString = gson.toJson(encryptDataMap);
        encryptString = CryptUtil.urlsafe_b64encode(CryptUtil.encrypt(encryptJsonString, systemNetworkAesKey));
        if (expand == null) {
            expand = new HashMap<>();
        }

        //map转Json字符串
        expandJsonString = gson.toJson(expand);

        //数据签名
        signStr = CryptUtil.enhanceMD5(CryptUtil.requestSignValidator(
                encryptString, expandJsonString,networkRequestAPiKey ));

        body.put("encrypt",encryptString);
        body.put("expand",expandJsonString);
        body.put("sign",signStr);

        return  body;

    }

    public static String getVersionName(Context mContext){
        PackageManager pm = mContext.getPackageManager();
        String versionName = "";
        try {
            PackageInfo pi = pm.getPackageInfo(mContext.getPackageName(), 0);
            versionName = pi.versionName;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return versionName;
    }

    public static String getUniqueID(Context context) {
        String id = null;
        final String androidId = Settings.Secure.getString(context.getContentResolver(), Settings.Secure.ANDROID_ID);
        if (!TextUtils.isEmpty(androidId) && !"9774d56d682e549c".equals(androidId)) {
            try {
                UUID uuid = UUID.nameUUIDFromBytes(androidId.getBytes("utf8"));
                id = uuid.toString();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        if (TextUtils.isEmpty(id)) {
            id = getUUID();
        }

        return TextUtils.isEmpty(id) ? UUID.randomUUID().toString() : id;
    }

    private static String getUUID() {
        String serial = null;

        String m_szDevIDShort = "35" +
                Build.BOARD.length() % 10 + Build.BRAND.length() % 10 +

                Build.CPU_ABI.length() % 10 + Build.DEVICE.length() % 10 +

                Build.DISPLAY.length() % 10 + Build.HOST.length() % 10 +

                Build.ID.length() % 10 + Build.MANUFACTURER.length() % 10 +

                Build.MODEL.length() % 10 + Build.PRODUCT.length() % 10 +

                Build.TAGS.length() % 10 + Build.TYPE.length() % 10 +

                Build.USER.length() % 10; //13 位

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                serial = android.os.Build.getSerial(); // TODO crash in Q
            } else {
                serial = Build.SERIAL;
            }
            //API>=9 使用serial号
            return new UUID(m_szDevIDShort.hashCode(), serial.hashCode()).toString();
        } catch (Exception exception) {
            serial = "serial"; // 随便一个初始化
        }

        //使用硬件信息拼凑出来的15位号码
        return new UUID(m_szDevIDShort.hashCode(), serial.hashCode()).toString();
    }

}
