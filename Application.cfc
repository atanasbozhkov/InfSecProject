<cfcomponent displayname="SecureComponent" output="true" hint="handle the application">
    <cfset This.name = "SecureComponent">
    <cfset This.sessionManagement=true>
    <cfset This.Sessiontimeout="#createtimespan(0,0,10,0)#">
    <cfset This.applicationtimeout="#createtimespan(5,0,0,0)#">
    <cfset This.loginstorage="session">

    <cfinvoke component="components.config" method="getConfig" returnVariable="config">

    <!--- while trying access, it checks authentication --->
    <cffunction name="OnRequestStart">
        <!--- exclude a list of pages --->
        <cfargument name="page" type="string" required="true">
        <cfset pagename=listLast(arguments.page, "/")>
        <cfif listFindNoCase(config.protectList, pagename) eq 0>
            <cfreturn true>
        </cfif>

        <cfif NOT IsUserLoggedIn()>
            <cfinclude template="index.cfm">
            <cfreturn false>
        </cfif>

    </cffunction>

</cfcomponent>