<cfcomponent displayname="authenticationController" hint="login">

    <cffunction name="checkPw" access="public" returntype="numeric">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        
        <cfinvoke component="models.authModel" method="getAuthData" returnvariable="loginQuery">
            <cfinvokeargument name="email" value="#email#">
        </cfinvoke>

        <cfif loginQuery.RecordCount eq 1>
            <cfif compare(loginQuery.password, hash(password&loginQuery.salt, "SHA-512")) eq 0>
                <cfreturn loginQuery.role_id>
            </cfif>
        </cfif>

        <cfreturn 0>
    </cffunction>

    <cffunction name="login" access="remote" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <!--- <cfif IsUserLoggedIn()> --->
        <cfif GetAuthUser() eq email>
            <cfreturn true>
        </cfif>

        <cfset auth = false>

        <cfset SESSION.user_id = -1>
        <cfset SESSION.email = "">
        <cfset userId = -1>

        <cflogin>
            <cfif email neq "" AND password neq "">

                <cfinvoke component="models.userModel" method="getUser" returnvariable="userData">
                    <cfinvokeargument name="email" value="#email#">
                </cfinvoke>

                <cfif userData.RecordCount neq 0>
                    <cfset userId = userData.user_id>

                    <cfinvoke method="checkPw" returnvariable="userRoleId">
                        <cfinvokeargument name="email" value="#email#">
                        <cfinvokeargument name="password" value="#password#">
                    </cfinvoke>
                    
                    <cfif userRoleId neq 0>
                        <cfif userRoleId eq 1>
                            <cfloginuser name="#email#" Password = "#password#" roles="user">
                        <cfelseif userRoleId eq 2>
                            <cfloginuser name="#email#" Password = "#password#" roles="admin">
                        </cfif>

                        <cfset auth = true>
                        <cfset SESSION.user_id = userData.user_id>
                        <cfset SESSION.email = userData.email>
                    </cfif>

                </cfif>

                <cfinvoke component="models.logModel" method="loginAttempt">
                    <cfinvokeargument name="user_id" value="#userId#">
                    <cfinvokeargument name="success" value="#auth#">
                </cfinvoke>
            </cfif>
        </cflogin>

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