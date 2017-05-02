<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#assign externalKeyParam = "&amp;externalLoginKey=" + requestAttributes.externalLoginKey!>

<#if (requestAttributes.person)??><#assign person = requestAttributes.person></#if>
<#if (requestAttributes.partyGroup)??><#assign partyGroup = requestAttributes.partyGroup></#if>
<#assign docLangAttr = locale.toString()?replace("_", "-")>
<#assign langDir = "ltr">
<#if "ar.iw"?contains(docLangAttr?substring(0, 2))>
    <#assign langDir = "rtl">
</#if>
<#if layoutSettings.headerImageUrl?exists>
    <#assign headerImageUrl = layoutSettings.headerImageUrl>
      <#elseif layoutSettings.commonHeaderImageUrl?exists>
        <#assign headerImageUrl = layoutSettings.commonHeaderImageUrl>
      <#elseif layoutSettings.VT_HDR_IMAGE_URL?exists>
    <#assign headerImageUrl = layoutSettings.VT_HDR_IMAGE_URL.get(0)>
</#if>
<#if (requestAttributes.externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>
<#if (externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>
<#assign ofbizServerName = application.getAttribute("_serverId")?default("default-server")>
<#assign contextPath = request.getContextPath()>
<#assign displayApps = Static["org.apache.ofbiz.webapp.control.LoginWorker"].getAppBarWebInfos(security, userLogin, ofbizServerName, "main")>
<#assign displaySecondaryApps = Static["org.apache.ofbiz.webapp.control.LoginWorker"].getAppBarWebInfos(security, userLogin, ofbizServerName, "secondary")>

<#assign appModelMenu = Static["org.apache.ofbiz.widget.model.MenuFactory"].getMenuFromLocation(applicationMenuLocation,applicationMenuName)>
<#if appModelMenu.getModelMenuItemByName(headerItem)??>
  <#if headerItem!="main">
    <#assign show_last_menu = true>
  </#if>
</#if>

<#if parameters.portalPageId?? && !appModelMenu.getModelMenuItemByName(headerItem)??>
  <#assign show_last_menu = true>
</#if>
<html lang="${docLangAttr}" dir="${langDir}" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <title>${layoutSettings.companyName}: <#if (titleProperty)?has_content>${uiLabelMap[titleProperty]}<#else>${title!}</#if></title>

    <meta name="robots" content="index, follow" />
    <meta name="googlebot" content="index,follow" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="copyright" content="" />
    <meta name="MSSmartTagsPreventParsing" content="true" />
    <meta name="author" content="" />

    <link rel="start" href="" title="" />
    <#if layoutSettings.shortcutIcon?has_content>
      <#assign shortcutIcon = layoutSettings.shortcutIcon/>
    <#elseif layoutSettings.VT_SHORTCUT_ICON?has_content>
      <#assign shortcutIcon = layoutSettings.VT_SHORTCUT_ICON.get(0)/>
    </#if>
    <#if shortcutIcon?has_content>
    <link rel="shortcut icon" href="<@ofbizContentUrl>${StringUtil.wrapString(shortcutIcon)}</@ofbizContentUrl>" />
    </#if>
    <#if layoutSettings.VT_HDR_JAVASCRIPT?has_content>
        <#list layoutSettings.VT_HDR_JAVASCRIPT as javaScript>
            <script src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>" type="text/javascript"></script>
        </#list>
    </#if>
    <#if layoutSettings.javaScripts?has_content>
      <#--layoutSettings.javaScripts is a list of java scripts. -->
      <#-- use a Set to make sure each javascript is declared only once, but iterate the list to maintain the correct order -->
      <#assign javaScriptsSet = Static["org.apache.ofbiz.base.util.UtilMisc"].toSet(layoutSettings.javaScripts)/>
      <#list layoutSettings.javaScripts as javaScript>
        <#if javaScriptsSet.contains(javaScript)>
          <#assign nothing = javaScriptsSet.remove(javaScript)/>
          <script src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>" type="text/javascript"></script>
        </#if>
      </#list>
    </#if>

    <#if layoutSettings.styleSheets?has_content>
        <#list layoutSettings.styleSheets as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" media="screen,projection" type="text/css" charset="UTF-8"/>
        </#list>
    </#if>
    <#if userLogin?has_content>
    <#if layoutSettings.VT_STYLESHEET?has_content>
        <#list layoutSettings.VT_STYLESHEET as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" media="screen,projection" type="text/css" charset="UTF-8"/>
        </#list>
    </#if>
    <#else>
        <link rel="stylesheet" href="/bizznesstime/css/login.css" type="text/css"/>
    </#if>
    <#if layoutSettings.rtlStyleSheets?has_content && langDir == "rtl">
        <#--layoutSettings.rtlStyleSheets is a list of rtl style sheets.-->
        <#list layoutSettings.rtlStyleSheets as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" media="screen,projection" type="text/css" charset="UTF-8"/>
        </#list>
    </#if>
    <#if layoutSettings.VT_RTL_STYLESHEET?has_content && langDir == "rtl">
        <#list layoutSettings.VT_RTL_STYLESHEET as styleSheet>
            <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" media="screen,projection" type="text/css" charset="UTF-8"/>
        </#list>
    </#if>
    ${layoutSettings.extraHead?if_exists}
    <#if layoutSettings.VT_EXTRA_HEAD?has_content>
        <#list layoutSettings.VT_EXTRA_HEAD as extraHead>
            ${extraHead}
        </#list>
    </#if>
    <#if layoutSettings.WEB_ANALYTICS?has_content>
      <script language="JavaScript" type="text/javascript">
        <#list layoutSettings.WEB_ANALYTICS as webAnalyticsConfig>
          ${StringUtil.wrapString(webAnalyticsConfig.webAnalyticsCode!)}
        </#list>
      </script>
    </#if>
    </head>
	<#if layoutSettings.headerImageLinkUrl??>
	  <#assign logoLinkURL = "${layoutSettings.headerImageLinkUrl}">
	<#else>
	  <#assign logoLinkURL = "${layoutSettings.commonHeaderImageLinkUrl}">
	</#if>
	<#assign organizationLogoLinkURL = "${layoutSettings.organizationLogoLinkUrl!}">
	  
    <#assign appModelMenu = Static["org.apache.ofbiz.widget.model.MenuFactory"].getMenuFromLocation(applicationMenuLocation,applicationMenuName)>
	<#if person?has_content>
	  <#assign userName = (person.firstName!) + " " + (person.middleName!) + " " + person.lastName!>
	<#elseif partyGroup?has_content>
	  <#assign userName = partyGroup.groupName!>
	<#elseif userLogin??>
	  <#assign userName = userLogin.userLoginId>
	<#else>
	  <#assign userName = "">
	</#if>
	<#if defaultOrganizationPartyGroupName?has_content>
	  <#assign orgName = " - " + defaultOrganizationPartyGroupName!>
	<#else>
	  <#assign orgName = "">
	</#if>
	<#assign organizationLogoLinkURL = "${layoutSettings.organizationLogoLinkUrl?if_exists}">
<body>


  <div id="header">
   <nav class="navbar navbar-default navbar-static-top" role="navigation" id="header-navigation">
      <div class="container-fluid">
          <div class="navbar-header">
              <a class="navbar-brand" href="<@ofbizUrl>${logoLinkURL}</@ofbizUrl>">
                <#if headerImageUrl?exists>
                    <#if organizationLogoLinkURL?has_content>
                        <img class="img-responsive" alt="${layoutSettings.companyName}" src="<@ofbizContentUrl>${StringUtil.wrapString(organizationLogoLinkURL)}</@ofbizContentUrl>">
                    <#else>
                        <img alt="${layoutSettings.companyName}" src="<@ofbizContentUrl>${StringUtil.wrapString(headerImageUrl)}</@ofbizContentUrl>">
                    </#if>
                <#else>
                    ${layoutSettings.companyName}
                 </#if>
            </a>
          </div>
          <ul class="nav navbar-nav application-navbar">
              <#if userLogin?has_content>
                  <li class="dropdown"><#-- Primary Applications -->
                        <button class="button-navbar" data-toggle="dropdown" type="button" aria-expanded="false" title="${userName}">
                            <i class="glyphicon glyphicon-th"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-main-navbar" role="menu">
                            <#list displayApps as display>
                                  <#assign thisApp = display.getContextRoot()>
                                  <#assign permission = true>
                                  <#assign selected = false>
                                  <#assign permissions = display.getBasePermission()>
                                  <#list permissions as perm>
                                    <#if (perm != "NONE" && !security.hasEntityPermission(perm, "_VIEW", session))>
                                      <#-- User must have ALL permissions in the base-permission list -->
                                      <#assign permission = false>
                                    </#if>
                                  </#list>
                                  <#if permission == true>
                                    <#if thisApp == contextPath || contextPath + "/" == thisApp>
                                      <#assign selected = true>
                                    </#if>
                                    <#assign thisApp = StringUtil.wrapString(thisApp)>
                                    <#assign thisURL = thisApp>
                                    <#if thisApp != "/">
                                      <#assign thisURL = thisURL + "/control/main">
                                    </#if>
                                    <#if layoutSettings.suppressTab?exists && display.name == layoutSettings.suppressTab>
                                      <!-- do not display this component-->
                                    <#else>
                                      <li<#if selected> class="selected"</#if>><a href="${thisURL + externalKeyParam}"<#if uiLabelMap?exists> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a></li>
                                    </#if>
                                  </#if>
                                </#list>
                        </ul>
                </li><#-- Primary Applications dropdown ends-->
                <li class="dropdown" id="secondary-application-menu"><#-- Secondary Applications -->
                    <div class="btn-group navbar-btn">
                          <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-plus button-label"></span>More Applications</button>
                          <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button" aria-expanded="false">
	                            <span class="caret"></span>
	                            <span class="sr-only">Toggle Dropdown</span>
                        	</button>
                        <#-- <a href="#" class="dropdown-toggle" data-toggle="dropdown">More Applications <span class="caret"></span></a> -->
                          <ul class="dropdown-menu" role="menu">
                              <#list displaySecondaryApps as display>
                                  <#assign thisApp = display.getContextRoot()>
                                  <#assign permission = true>
                                  <#assign selected = false>
                                  <#assign permissions = display.getBasePermission()>
                                      <#list permissions as perm>
                                        <#if (perm != "NONE" && !security.hasEntityPermission(perm, "_VIEW", session))>
                                              <#-- User must have ALL permissions in the base-permission list -->
                                              <#assign permission = false>
                                        </#if>
                                      </#list>
                                      <#if permission == true>
                                        <#if thisApp == contextPath || contextPath + "/" == thisApp>
                                              <#assign selected = true>
                                        </#if>
                                        <#assign thisApp = StringUtil.wrapString(thisApp)>
                                        <#assign thisURL = thisApp>
                                        <#if thisApp != "/">
                                              <#assign thisURL = thisURL + "/control/main">
                                        </#if>
                                        <#if layoutSettings.suppressTab?exists && display.name == layoutSettings.suppressTab>
                                          <!-- do not display this component-->
                                        <#else>
                                            <li<#if selected> class="selected"</#if>><a href="${thisURL + externalKeyParam}"<#if uiLabelMap?exists> title="${uiLabelMap[display.description]}">${uiLabelMap[display.title]}<#else> title="${display.description}">${display.title}</#if></a></li>
                                        </#if>
                                      </#if>
                            </#list>
                          </ul>
                      </div><#-- btn-group ends -->
                  </li><#-- Secondary Applications ends -->
                  <#--if webSiteId?exists && requestAttributes._CURRENT_VIEW_?exists && helpTopic?exists-->
              </#if>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          <#if parameters.componentName?exists && requestAttributes._CURRENT_VIEW_?exists && helpTopic?exists>
              <#include "component://common/template/includes/HelpLink.ftl" />
              <li>
                  <button class="button-navbar" data-toggle="dropdown" type="button" aria-expanded="false" onclick="javascript:lookup_popup1('showHelp?helpTopic=${helpTopic}&amp;portalPageId=${parameters.portalPageId?if_exists}','help' ,500,500);" title="${uiLabelMap.CommonHelp}">
                        <i class="glyphicon glyphicon-question-sign"></i>
                  </button>
                </li>
          </#if>
          <#if layoutSettings.middleTopMessage1?has_content && layoutSettings.middleTopMessage1 != " ">
              <li class="dropdown">
                  <button class="button-navbar" data-toggle="dropdown" type="button" aria-expanded="false">
                      <i class="glyphicon glyphicon-envelope"></i>
                  </button>
                  <i class="badge-red">${layoutSettings.middleTopMessage1?size}</i>
              <#-- <a href="#" class="dropdown-toggle" data-toggle="dropdown">Messages <span class="caret"></span></a> -->
                  <ul class="dropdown-menu dropdown-main-navbar" role="menu">
                      <li><a href="${StringUtil.wrapString(layoutSettings.middleTopLink1!)}">${layoutSettings.middleTopMessage1?if_exists}</a></li>
                      <li><a href="${StringUtil.wrapString(layoutSettings.middleTopLink2!)}">${layoutSettings.middleTopMessage2?if_exists}</a></li>
                      <li><a href="${StringUtil.wrapString(layoutSettings.middleTopLink3!)}">${layoutSettings.middleTopMessage3?if_exists}</a></li>
                  </ul>
              </li>
          </#if>

          <#if userLogin?exists>
                  <#if orgName?has_content>
                    <li class="org">${orgName}</li>
                  </#if>
                  <#if userLogin.partyId?exists>
                    <li class="dropdown">
                        <button class="button-navbar" data-toggle="dropdown" type="button" aria-expanded="false" title="${userName}">
                            <i class="glyphicon glyphicon-user"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-main-navbar" role="menu">
                            <li>${userName}</li>
                            <li role="presentation" class="divider"></li>
                            <li><a href="<@ofbizUrl>passwordChange</@ofbizUrl>"><i class="glyphicon glyphicon-lock"></i> ${uiLabelMap.PartyChangePassword}</a></li>
                            <li><a href="<@ofbizUrl>ListVisualThemes</@ofbizUrl>"><i class="glyphicon glyphicon-list"></i> ${uiLabelMap.CommonVisualThemes}</a></li>
                            <li><a href="<@ofbizUrl>ListLocales</@ofbizUrl>"><i class="glyphicon glyphicon-globe"></i> ${uiLabelMap.CommonLanguageTitle}</a></li>
                            <li role="presentation" class="divider"></li>
                            <li><a href="<@ofbizUrl>logout</@ofbizUrl>"><i class="glyphicon glyphicon-off"></i> ${uiLabelMap.CommonLogout}</a></li>
                        </ul>
                    </li>
                  <#else>
                    <li class="user">${userName}</li>
                  </#if>
              <#else>
                  <li>
                      <div class="btn-group">
                          <button class="btn btn-default navbar-btn" type="button" aria-expanded="false">
                              <span class="glyphicon glyphicon-off"></span>
                        </button>
                        <a class="btn btn-default navbar-btn" href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>">${uiLabelMap.CommonLogin}</a>
                      </div>
                   </li>
            </#if>
            <#--
            <#if userLogin?exists>
                  <#if (userPreferences.COMPACT_HEADER)?default("N") == "Y">
                    <li class="collapsed"><a href="javascript:document.setUserPreferenceCompactHeaderN.submit()">&nbsp;</a>
                          <form name="setUserPreferenceCompactHeaderN" method="post" action="<@ofbizUrl>setUserPreference</@ofbizUrl>">
                            <input type="hidden" name="userPrefGroupTypeId" value="GLOBAL_PREFERENCES"/>
                            <input type="hidden" name="userPrefTypeId" value="COMPACT_HEADER"/>
                            <input type="hidden" name="userPrefValue" value="N"/>
                          </form>
                    </li>
                  <#else>
                    <li class="expanded"><a href="javascript:document.setUserPreferenceCompactHeaderY.submit()">&nbsp;</a>
                          <form name="setUserPreferenceCompactHeaderY" method="post" action="<@ofbizUrl>setUserPreference</@ofbizUrl>">
                            <input type="hidden" name="userPrefGroupTypeId" value="GLOBAL_PREFERENCES"/>
                            <input type="hidden" name="userPrefTypeId" value="COMPACT_HEADER"/>
                            <input type="hidden" name="userPrefValue" value="Y"/>
                          </form>
                    </li>
                  </#if>
            </#if>
            -->
          </ul>
      </div> <!-- container-fluid -->
  </nav>

  </div>

