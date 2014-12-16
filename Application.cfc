<cfcomponent displayname="SecureComponent" output="true" hint="handle the application">
    <cfset This.name = "SecureComponent">
    <cfset This.sessionManagement=true>
    <cfset This.Sessiontimeout="#createtimespan(0,0,20,0)#">
    <cfset This.applicationtimeout="#createtimespan(5,0,0,0)#">
    <cfset This.loginstorage="session">
    <cfset This.mappings["/local"] = getDirectoryFromPath(getCurrentTemplatePath()) />

    <cfinvoke component="components.config" method="getConfig" returnvariable="config">

    <cfset This.datasource = config.sourcename>

    <cfset toolList = "charts.cfm,settings.cfm,popup.cfm">
    <cfset protectList = rereplace(config.protectList, "[[:space:]]","","ALL")>

    <cfset APPLICATION.setup = true>

    <!--- trigger when the first time the application run --->
    <cffunction name="onApplicationStart">
        <cfinvoke component="components.init" method="checkSchema" returnvariable="schemaExist">
        <cfif schemaExist eq false>
            <cfset APPLICATION.setup = false>
        </cfif>
        <cfreturn true>
    </cffunction>

    <!--- while trying access, it checks authentication --->
    <cffunction name="OnRequestStart">
        <!--- exclude a list of pages --->
        <cfargument name="page" type="string" required="true">
        <cfset pagename=listLast(arguments.page, "/")>

        <cfif NOT APPLICATION.setup>
            <cfif listFindNoCase("setupFinished.cfm", pagename)>
                <cfreturn true>
            </cfif>

            <cfif NOT listFindNoCase("setup.cfm", pagename)>
                <cflocation url="setup.cfm">
            </cfif>
            <cfreturn true>
        </cfif>

        <cfif listFindNoCase(protectList&","&toolList, pagename) eq 0>
            <cfreturn true>
        </cfif>

        <!--- <cfif NOT IsUserLoggedIn()> --->
        <cfif GetAuthUser() eq "">
            <cflocation url="index.cfm">
            <cfreturn true>
        </cfif>

        <cfset userRole = getUserRoles()>
        <cfif userRole eq "user" AND listFindNoCase(toolList, pagename) neq 0>
            <cfif listFindNoCase(toolList, config.firstPage) neq 0>
                <cflocation url="error.cfm">
                <cfreturn true>
            </cfif>
            <cflocation url="#config.firstPage#">
            <cfreturn true>
        </cfif>

    </cffunction>

</cfcomponent>