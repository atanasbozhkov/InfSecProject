<cfcomponent displayname="SecureComponent" output="true" hint="handle the application">
    <cfset This.name = "SecureComponent">
    <cfset This.sessionManagement=true>
    <cfset This.Sessiontimeout="#createtimespan(0,0,10,0)#">
    <cfset This.applicationtimeout="#createtimespan(5,0,0,0)#">
    <cfset This.loginstorage="session">
    <cfset This.mappings["/local"] = getDirectoryFromPath(getCurrentTemplatePath()) />

    <cfinvoke component="components.config" method="getConfig" returnvariable="config">

    <cfset This.datasource = config.sourcename>

    <cfset protectList = config.protectList>

    <cfset APPLICATION.setup = true>

    <!--- trigger when the first time the application run --->
    <cffunction name="onApplicationStart">
        <cflog text="onApplicationStart" file="teamD">
        <!--- <cfset initSuccess = true> --->
        <cfinvoke component="components.init" method="checkSchema" returnvariable="schemaExist">
        <cfif schemaExist eq false>
            <cflog text="schmea not exist" file="teamD">
            <!--- <cfinvoke component="components.init" method="createSchema" returnvariable="schemaCreated">
            <cfset initSuccess = schemaCreated> --->
            <cfset APPLICATION.setup = false>
        </cfif>

        <!--- <cfreturn initSuccess> --->
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

        <cfif listFindNoCase(protectList, pagename) eq 0>
            <cfreturn true>
        </cfif>

        <cfif NOT IsUserLoggedIn()>
            <cflocation url="index.cfm">
            <cfreturn true>
        </cfif>

    </cffunction>

</cfcomponent>