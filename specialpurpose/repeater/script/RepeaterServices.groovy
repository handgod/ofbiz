package org.apache.ofbiz.repeater;
import org.apache.ofbiz.entity.GenericEntityException;

def createRepeaterDemo() {
    result = [:];
    try {
        RepeaterDemo = delegator.makeValue("RepeaterDemo");
        // Auto generating next sequence of RepeaterDemoId primary key
        RepeaterDemo.setNextSeqId();
        // Setting up all non primary key field values from context map
        RepeaterDemo.setNonPKFields(context);
        // Creating record in database for RepeaterDemo entity for prepared value
        RepeaterDemo = delegator.create(RepeaterDemo);
        result.RepeaterDemoId = RepeaterDemo.RepeaterDemoId;
        logInfo("==========This is my first Groovy Service implementation in Apache OFBiz. OfbizDemo record "
                +"created successfully with ofbizDemoId: "+RepeaterDemo.getString("RepeaterDemoId"));
    } catch (GenericEntityException e) {
        logError(e.getMessage());
        return error("Error in creating record in OfbizDemo entity ........");
    }
    return result;
}