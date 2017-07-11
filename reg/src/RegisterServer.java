
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
/**
 * Created by Administrator on 2017/7/10.
 */

public class RegisterServer {

  //  private static String url = "http://localhost:8080/repeater/control/RepeaterRegEvents";//nat.vivo.com.cn
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

        boolean reg_success = reg(imei);

    }
    private static void init(){
        imei = null;
        uniqueId = null;
        target = null;
    }
    public static boolean reg(String imei) {
        String str = null;
        init();
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
