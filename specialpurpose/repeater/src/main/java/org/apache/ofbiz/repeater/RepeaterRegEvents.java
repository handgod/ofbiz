package org.apache.ofbiz.repeater;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.base.util.UtilMisc;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.service.GenericServiceException;
import org.apache.ofbiz.service.LocalDispatcher;

public class RepeaterRegEvents {

    public static final String module = RepeaterRegEvents.class.getName();

    public static String regRepeaterEvent(HttpServletRequest request, HttpServletResponse response) {
        Delegator delegator = (Delegator) request.getAttribute("delegator");
        LocalDispatcher dispatcher = (LocalDispatcher) request.getAttribute("dispatcher");
        GenericValue userLogin = (GenericValue) request.getSession().getAttribute("userLogin");

        String RepeaterDemoTypeId = request.getParameter("RepeaterDemoTypeId");
        String IMEI = request.getParameter("IMEI");
        String uniqueId = request.getParameter("uniqueId");
        String RepeaterIpAddress = request.getParameter("RepeaterIpAddress");

        if (UtilValidate.isEmpty(IMEI) || UtilValidate.isEmpty(uniqueId)) {
            String errMsg = "IMEI and uniqueId are required fields on the form and can't be empty.";
         //   request.setAttribute("_ERROR_MESSAGE_", errMsg);
            return "error";
        }
        String comments = request.getParameter("comments");

        //for request return json. ref public class EbayStoreOptions :retrieveThemeColorSchemeByThemeId
        Map<String,Object> regInfo = new HashMap<String, Object>();
        regInfo.put("IMEI",IMEI);
        regInfo.put("uniqueId","123456");
        regInfo.put("RepeaterIpAddress","118.89.48.252");
        request.setAttribute("regInfo", regInfo);


        try {
            Debug.logInfo("=======Creating Repeater record in event using service createOfbizDemoByGroovyService=========", module);
            dispatcher.runSync("createRepeaterDemoByGroovyService", UtilMisc.toMap("RepeaterDemoTypeId", RepeaterDemoTypeId,
                    "IMEI", IMEI, "uniqueId", uniqueId, "RepeaterIpAddress", RepeaterIpAddress,"comments", comments, "userLogin", userLogin));
        } catch (GenericServiceException e) {
     //       String errMsg = "Unable to create new records in Repeater entity: " + e.toString();
        //    request.setAttribute("_ERROR_MESSAGE_", errMsg);
            return "error";
        }



        //  request.setAttribute("_EVENT_MESSAGE_", "Repeater created succesfully.");
        return "success";
    }
}