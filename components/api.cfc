<cfcomponent rest="true" restPath="/api" displayname="API" hint="api interface">
    <cfset dbManager = createObject("component","dbManager").init()>
    <cfinvoke component="#dbManager#" method="getUsername" returnvariable="userName">
    <cfinvoke component="config" method="getConfig" returnVariable="config">

    <cffunction name="login" access="remote" httpmethod="GET" restpath="login" returntype="boolean" produces="application/json">

        <cfif IsUserLoggedIn()>
            <cfreturn true>
        </cfif>

        <cfset auth = false>

        <cflogin>
            <cfif NOT isDefined("cflogin")>
                <cfinclude template="../index.cfm">
            <cfelse>
                <cfif cflogin.name IS "" OR cflogin.password IS "">
                    <cfinclude template="../index.cfm">
                    <cfoutput>
                        <h4>You must enter text in both the User Name and Password fields.</h4>
                    </cfoutput>
                <cfelse>
                    <cfquery name="loginQuery" dataSource="#config.sourceName#">
                        SELECT users.username, passwords.password, passwords.salt FROM users, passwords
                        WHERE users.username = '#cflogin.name#' AND passwords.pass_id = users.pass_id
                    </cfquery>
                    <cfif loginQuery.RecordCount eq 1>
                        <cfif compare(loginQuery.password, hash(cflogin.password&loginQuery.salt, "SHA-512")) eq 0>
                            <cfloginuser name="#cflogin.name#" Password = "#loginQuery.password#" roles="admin">
                            <cfset auth = true>
                        <cfelse>
                            <cfinclude template="../index.cfm">
                            <cfoutput>
                                <h4>Your login information is not valid.<br>Please Try again</h4>
                            </cfoutput>
                        </cfif>
                    <cfelse>
                        <cfinclude template="../index.cfm">
                        <cfoutput>
                            <h4>Your login information is not valid.<br>Please Try again</h4>
                        </cfoutput>
                    </cfif>
                </cfif>
            </cfif>
        </cflogin>

        <cfreturn auth>
    </cffunction>

</cfcomponent>