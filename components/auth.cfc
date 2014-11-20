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
                    <cfif compare(loginQuery.password, hash(password&loginQuery.salt, "SHA-512")) eq 0>
                        <cfloginuser name="#email#" Password = "#loginQuery.password#" roles="admin">
                        <cfset auth = true>
                    </cfif>
                </cfif>
            </cfif>
        </cflogin>

        <cfif auth>
            <cfinvoke component="models.logModel" method="loginAttempt">
                <cfinvokeargument name="email" value="#email#">
                <cfinvokeargument name="success" value="#auth#">
            </cfinvoke>
        </cfif>

        <cfreturn auth>
    </cffunction>

    <cffunction name="logout" access="remote" returntype="void">
        <cflogout>
    </cffunction>

    <cffunction name="secQues" access="remote" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfargument name="answer" type="string" required="true">
        <!--- check security answer --->
        <cfreturn true>
    </cffunction>
    
</cfcomponent>