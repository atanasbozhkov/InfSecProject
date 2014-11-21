<cfcomponent displayname="authenticationController" hint="login">

    <cffunction name="checkPw" access="public" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        
        <cfinvoke component="models.authModel" method="getAuthData" returnvariable="loginQuery">
            <cfinvokeargument name="email" value="#email#">
        </cfinvoke>

        <cfif loginQuery.RecordCount eq 1>
            <cfif compare(loginQuery.password, hash(password&loginQuery.salt, "SHA-512")) eq 0 AND loginQuery.role_id eq 2>
                <cfreturn true>
            </cfif>
        </cfif>

        <cfreturn false>
    </cffunction>

    <cffunction name="login" access="remote" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfif IsUserLoggedIn()>
            <cfreturn true>
        </cfif>

        <cfset auth = false>

        <cflogin>
            <cfif email neq "" AND password neq "">
                <cfinvoke method="checkPw" returnvariable="authSuccess">
                    <cfinvokeargument name="email" value="#email#">
                    <cfinvokeargument name="password" value="#password#">
                </cfinvoke>
                
                <cfif authSuccess>
                    <cfloginuser name="#email#" Password = "#password#" roles="admin">
                    <cfset auth = true>

                    <cfinvoke component="models.userModel" method="getUser" returnvariable="userData">
                        <cfinvokeargument name="email" value="#email#">
                    </cfinvoke>
                    <cfset SESSION.user_id = userData.user_id>
                    <cfset SESSION.email = userData.email>
                </cfif>
            </cfif>
        </cflogin>

        <cfinvoke component="models.logModel" method="loginAttempt">
            <cfinvokeargument name="user_id" value="#SESSION.user_id#">
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