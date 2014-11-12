<cfcomponent displayname="API" hint="api interface">
    <cfset dbManager = createObject("component","dbManager").init()>
    <cfinvoke component="#dbManager#" method="getUsername" returnvariable="userName">

    <cffunction name="login" access="remote" returntype="string">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfif IsUserLoggedIn()>
            <cfreturn true>
        </cfif>

        <cfset auth = false>

        <cflogin>
            <cfif username neq "" AND password neq "">
                <cfinvoke component="#dbManager#" method="getAuthData" returnvariable="loginQuery">
                    <cfinvokeargument name="username" value="#username#">
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

    <cffunction name="register" access="remote" returntype="string">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="firstname" type="string" required="true">
        <cfargument name="lastname" type="string" required="true">

        <cfset result.status = false>
        <cfset result.msg = "unknown">

        <cfif len(email) eq 0 OR len(password) eq 0 OR len(firstname) eq 0 OR len(lastname) eq 0>
            <cfset result.msg = "missing field">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfset salt = hash(rand("SHA1PRNG"), "SHA-512")>
        <cfset hash = hash(password&salt, "SHA-512")>

        <cfinvoke component="#dbManager#" method="isUserExist" returnvariable="userExist">
            <cfinvokeargument name="email" value="#email#">
        </cfinvoke>

        <cfif userExist>
            <cfset result.msg = "email registered">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfinvoke component="#dbManager#" method="addUser" returnvariable="userResult">
            <cfinvokeargument name="email" value="#email#">
            <cfinvokeargument name="firstname" value="#firstname#">
            <cfinvokeargument name="lastname" value="#lastname#">
            <cfinvokeargument name="hash" value="#hash#">
            <cfinvokeargument name="salt" value="#salt#">
        </cfinvoke>

        <cfif NOT userResult.success>
            <!--- remove error data (userResult.userid userResult.pwid) --->
            <cfset result.msg = "Error Occur">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfset result.status = true>
        <cfset result.msg = "success created account">
        <cfreturn serializeJSON(result)>
    </cffunction>

</cfcomponent>