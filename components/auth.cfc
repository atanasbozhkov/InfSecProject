<cfcomponent displayname="authenticationController" hint="login">

    <cffunction name="login" access="remote" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfif IsUserLoggedIn()>
            <cfreturn true>
        </cfif>

        <cfset auth = false>

        <cflogin>
            <cfif email neq "" AND password neq "">
                <cfinvoke component="models.authModel" method="getAuthData" returnvariable="loginQuery">
                    <cfinvokeargument name="email" value="#email#">
                </cfinvoke>
                <cfif loginQuery.RecordCount eq 1>
                    <cfif compare(loginQuery.password, hash(password&loginQuery.salt, "SHA-512")) eq 0 AND loginQuery.role_id eq 2>
                        <cfloginuser name="#email#" Password = "#loginQuery.password#" roles="admin">
                        <cfset auth = true>
                    </cfif>
                </cfif>
            </cfif>
        </cflogin>

        <cfinvoke component="models.logModel" method="loginAttempt">
            <cfinvokeargument name="user_id" value="#loginQuery.user_id#">
            <cfinvokeargument name="success" value="#auth#">
        </cfinvoke>

        <cfreturn auth>
    </cffunction>

    <cffunction name="logout" access="remote" returntype="void">
        <cflogout>
    </cffunction>

    <cffunction name="secQues" access="remote" returntype="boolean">
        <cfargument name="user_id" type="string" required="true">
        <cfargument name="answer" type="string" required="true">
        <!--- check security answer --->
        <cfreturn true>
    </cffunction>

</cfcomponent>