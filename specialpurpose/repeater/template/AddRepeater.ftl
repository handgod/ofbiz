<div class="screenlet-body">
    <form id="createRepeaterDemoEvent" method="post" action="<@ofbizUrl>createRepeaterDemoEvent</@ofbizUrl>">
        <input type="hidden" name="addRepeaterFromFtl" value="Y"/>
        <fieldset>
            <div>
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