<cfcomponent displayname="DBManager" hint="datasource reader">
    <!--- variable initialize --->
    <cfinvoke component="config" method="getConfig" returnVariable="config">

    <!--- init function --->
    <cffunction name="init" access="public" returntype="dbManager">
        <cfreturn this />
    </cffunction>

	<cffunction name="getUsername" access="public" output="false" returntype="string">
        <cfquery name="getNames" datasource="#config.sourceName#">
            SELECT email FROM users
        </cfquery>

        <cfset json=arrayNew(1)>
        <cfloop query="getNames">
            <cfset arrayAppend(json, #email#)>
        </cfloop>

        <cfreturn SerializeJSON(json)/>
    </cffunction>

    <cffunction name="getAuthData" access="public" output="false" returntype="query">
        <cfargument name="username" type="string">

        <cfquery name="loginQuery" dataSource="#config.sourceName#">
            SELECT users.email, passwords.password, passwords.salt FROM users, passwords
            WHERE users.email = '#username#' AND passwords.pass_id = users.pass_id
        </cfquery>
        <cfreturn loginQuery/>
    </cffunction>

    <cffunction name="isUserExist" access="public" output="false" returntype="boolean">
        <cfargument name="email" type="string">

        <cfquery name="searchUser" dataSource="#config.sourceName#">
            SELECT email FROM users WHERE email = "#email#"
        </cfquery>
        <cfif searchUser.RecordCount neq 0>
            <cfreturn true>
        </cfif>
        <cfreturn false>
    </cffunction>
</cfcomponent>
