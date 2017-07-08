<div class="screenlet-body">
<#if RepeaterList?has_content>
    <table cellspacing=0 cellpadding=2 border=0 class="basic-table">
        <thead><tr>
            <th>${uiLabelMap.RepeaterId}</th>
            <th>${uiLabelMap.RepeaterType}</th>
            <th>${uiLabelMap.RepeaterIMEI}</th>
            <th>${uiLabelMap.RepeaterUniqueId}</th>
            <th>${uiLabelMap.RepeaterIpAddress}</th>
            <th>${uiLabelMap.comments}</th>
        </tr></thead>
        <tbody>
            <#list RepeaterList as RepeaterDemo>
            <tr>
                <td>${RepeaterDemo.RepeaterDemoId}</td>
                <td>${RepeaterDemo.getRelatedOne("RepeaterType").get("description", locale)}</td>
                <td>${RepeaterDemo.IMEI?default("NA")}</td>
                <td>${RepeaterDemo.uniqueId?default("NA")}</td>
                <td>${RepeaterDemo.RepeaterIpAddress?default("NA")}</td>
                <td>${RepeaterDemo.comments!}</td>
            </tr>
            </#list>
        </tbody>
    </table>
</#if>
</div>