<#-- tradional style.
<div class="screenlet-body">
    <form id="createRepeaterDemoEvent" method="post" action="<@ofbizUrl>createRepeaterDemoEvent</@ofbizUrl>">
        <input type="hidden" name="addRepeaterFromFtl" value="Y"/>
        <fieldset>
            <div >
                <span class="label">${uiLabelMap.RepeaterType}</span>
                <select name="RepeaterDemoTypeId" class='required'>
                <#list RepeaterTypes as RepeaterType>
                    <option value='${RepeaterType.RepeaterDemoTypeId}'>${RepeaterType.description}</option>
                </#list>
                </select>*
            </div>
            <div>
                <span class="label">${uiLabelMap.RepeaterIMEI}</span>
                <input type="text" name="IMEI" id="IMEI" class='required' maxlength="20" />*
            </div>
            <div>
                <span class="label">${uiLabelMap.RepeaterUniqueId}</span>
                <input type="text" name="uniqueId" id="uniqueId" class='required' maxlength="20" />*
            </div>
            <div>
                <span class="label">${uiLabelMap.RepeaterComments}</span>
                <input type="text" name="comments" id="comments" class='inputBox' size="60" maxlength="255" />
            </div>
        </fieldset>
        <input type="submit" value="${uiLabelMap.CommonAdd}" />
    </form>
</div>

-->
<#--bootstrap style-->
<div
<form method="post" action="<@ofbizUrl>createRepeaterDemoEvent</@ofbizUrl>" name="createRepeaterDemoEvent" class="form-horizontal">
    <div class="control-group">
        <label class="control-label" for="RepeaterDemoTypeId">${uiLabelMap.OfbizDemoType}</label>
        <div class="controls">
            <select id="RepeaterDemoTypeId" name="RepeaterDemoTypeId">
            <#list RepeaterTypes as RepeaterType>
                <option value='${RepeaterType.RepeaterDemoTypeId}'>${RepeaterType.description}</option>
            </#list>
            </select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="IMEI">${uiLabelMap.RepeaterIMEI}</label>
        <div class="controls">
            <input type="text" id="IMEI" name="IMEI" required>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="uniqueId">${uiLabelMap.RepeaterUniqueId}</label>
        <div class="controls">
            <input type="text" id="uniqueId" name="uniqueId" required>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="RepeaterIpAddress">${uiLabelMap.RepeaterIpAddress}</label>
        <div class="controls">
            <input type="text" id="RepeaterIpAddress" name="RepeaterIpAddress">
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="comments">${uiLabelMap.RepeaterComments}</label>
        <div class="controls">
            <input type="text" id="comments" name="comments">
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn">${uiLabelMap.CommonAdd}</button>
        </div>
    </div>
</form>
</div>