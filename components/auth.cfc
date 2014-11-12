<cfcomponent displayname="authenticationController" hint="login">

    <cffunction name="login" access="remote" returntype="string">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfif IsUserLoggedIn()>
            <cfreturn true>
        </cfif>

        <cfset auth = false>

        <cflogin>
            <cfif username neq "" AND password neq "">
                <cfinvoke component="models.authModel" method="getAuthData" returnvariable="loginQuery">
                    <cfinvokeargument name="email" value="#username#">
                </cfinvoke>
                <cfif loginQuery.RecordCount eq 1>
                    <cfif compare(loginQuery.password, hash(password&loginQuery.salt, "SHA-512")) eq 0>
                        <cfloginuser name="#username#" Password = "#loginQuery.password#" roles="admin">
                        <cfset auth = true>
                    </cfif>
                </cfif>
            </cfif>
        </cflogin>
        <cfreturn auth>
    </cffunction>

    <cffunction name="logout" access="remote" returntype="void">
        <cflogout>
    </cffunction>
</cfcomponent>