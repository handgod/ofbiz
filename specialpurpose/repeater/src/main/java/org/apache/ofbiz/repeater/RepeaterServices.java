package org.apache.ofbiz.repeater;

import java.util.Map;

import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.entity.GenericEntityException;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.service.DispatchContext;
import org.apache.ofbiz.service.ServiceUtil;

public class RepeaterServices {

    public static final String module = RepeaterServices.class.getName();

    public static Map<String, Object> createRepeaterDemo(DispatchContext dctx, Map<String, ? extends Object> context) {
        Debug.logInfo("==This is my first Java Service implementation in Apache OFBiz",module);
        Map<String, Object> result = ServiceUtil.returnSuccess();
        Delegator delegator = dctx.getDelegator();
        try {
            GenericValue RepeaterDemo = delegator.makeValue("RepeaterDemo");
            // Auto generating next sequence of RepeaterDemoId primary key
            RepeaterDemo.setNextSeqId();
            // Setting up all non primary key field values from context map
            RepeaterDemo.setNonPKFields(context);
            // Creating record in database for RepeaterDemo entity for prepared value
            RepeaterDemo = delegator.create(RepeaterDemo);
            result.put("RepeaterDemoId", RepeaterDemo.getString("RepeaterDemoId"));
            Debug.logInfo("==========This is my first Java Service implementation in Apache OFBiz. RepeaterDemoId record created successfully with ofbizDemoId: " + RepeaterDemo.getString("RepeaterDemoId"),module);
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
            return ServiceUtil.returnError("Error in creating record in RepeaterDemo entity ........" + module);
        }
        return result;
    }
}