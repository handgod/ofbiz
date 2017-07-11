
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import static android.content.Context.TELEPHONY_SERVICE;
import static java.net.Proxy.Type.HTTP;

/**
 * Created by Administrator on 2017/7/10.
 */

public class RegisterServer {

  //  private static String url = "http://localhost:8080/repeater/control/RepeaterRegEvents";
    private static String url = "http://118.89.48.252:8080/repeater/control/RepeaterRegEvents";

    private static String imei;
    private static String uniqueId;
    public static String target = null;

    private RegisterServer() {
    }

    public static void main(String[] args) {
        init();
        if (args != null && args.length > 1) {
            if (args.length == 3) {
                imei = args[0];
                uniqueId = args[1];
                target = args[2];
            }
        } else {
            imei = "1243sd4fqwe1476334q";
            uniqueId = "1sf3qwe45134263q";
            //          target = "42276";
        }

        boolean reg_success = reg();

    }
    private static void init(){
        imei = "1234567890987665";
        uniqueId = "123456";
        target = null;
    }
    public static boolean reg() {
        String str = null;
        init();
       /* TelephonyManager TelephonyMgr = (TelephonyManager) ChromeApplication.getInstance().getSystemService(TELEPHONY_SERVICE);
        imei = TelephonyMgr.getDeviceId();
        if (TextUtils.isEmpty(imei)) {
            imei = "random_" + String.valueOf(new Random().nextInt());
        }*/
        Map<String,String> map = new HashMap<String,String>();
        map.put("imei", imei);
        map.put("uniqueId", uniqueId);
        try {
            str = HttpClientUtils.post(new StringBuilder(url).toString(), map);
        } catch (Exception e) {
            e.printStackTrace();
            return Boolean.FALSE;
        }
        if (StringUtil.isBlank(str)) {
            return Boolean.FALSE;
        }
        WebResult result = JsonUtils.TO_OBJ(str, WebResult.class);
        if (!result.isStatus()) {
            return Boolean.FALSE;
        }
        Constants.REG_INFO = JsonUtils.TO_OBJ(result.getResult(), RegistResponse.class);
        return Boolean.TRUE;
    }

}
