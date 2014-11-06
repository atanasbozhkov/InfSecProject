<cfcomponent displayname="SecureComponent" output="true" hint="handle the application">
    <cfset This.name = "SecureComponent">
    <cfset This.sessionManagement=true>
    <cfset This.Sessiontimeout="#createtimespan(0,0,0,5)#">
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

        <!--- if the submitted form is logout --->
        <cfif isDefined("Form.logout")>
            <cflogout>
        </cfif>

        <cflogin> 
            <cfif NOT isDefined("cflogin")>
                <cfinclude template="index.cfm">
                <cfabort>
            <cfelse>
                <cfif cflogin.name IS "" OR cflogin.password IS "">
                    <cfinclude template="index.cfm">
                    <cfoutput>
                        <h4>You must enter text in both the User Name and Password fields.</h4>
                    </cfoutput>
                    <cfabort>
                <cfelse>
                    <cfquery name="loginQuery" dataSource="#config.sourceName#">
                        SELECT users.username, passwords.password, passwords.salt FROM users, passwords
                        WHERE users.username = '#cflogin.name#' AND passwords.user_id = users.user_id
                    </cfquery>
                    <cfif loginQuery.RecordCount eq 1>
                        <cfif compare(loginQuery.password, hash(cflogin.password&loginQuery.salt, "SHA-512")) eq 0>
                            <cfloginuser name="#cflogin.name#" Password = "#loginQuery.password#" roles="admin">
                        <cfelse>
                            <cfinclude template="index.cfm">
                            <cfoutput>
                                <h4>Your login information is not valid.<br>Please Try again</h4>
                            </cfoutput>
                            <cfabort>
                        </cfif>
                    <cfelse>
                        <cfinclude template="index.cfm">
                        <cfoutput>
                            <h4>Your login information is not valid.<br>Please Try again</h4>
                        </cfoutput>
                        <cfabort>
                    </cfif>
                </cfif>
            </cfif>
        </cflogin>

        <!--- check if user logged in --->
        <cfif GetAuthUser() NEQ "">
            <cfoutput>
                <form action="" method="Post">
                    <input type="submit" Name="logout" value="Logout" class="btn btn-primary btn-lg btn-block">
                </form>
            </cfoutput>
        </cfif>

    </cffunction>

</cfcomponent>