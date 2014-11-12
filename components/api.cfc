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
                        SELECT users.email, passwords.password, passwords.salt FROM users, passwords
                        WHERE users.email = '#cflogin.name#' AND passwords.pass_id = users.pass_id
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

    <cffunction name="logout" access="remote" httpmethod="GET" restpath="logout" returntype="void" produces="application/json">
        <cflogout>
    </cffunction>

    <cffunction name="register" access="remote" httpmethod="POST" restpath="register" returntype="string" produces="application/json">
        <cfargument name="email" type="string" required="true" restargsource="Form">
        <cfargument name="password" type="string" required="true" restargsource="Form">
        <cfargument name="firstname" type="string" required="true" restargsource="Form">
        <cfargument name="lastname" type="string" required="true" restargsource="Form">

        <cfset result.status = false>
        <cfset result.msg = "unknown">

        <cfif len(email) eq 0 OR len(password) eq 0 OR len(firstname) eq 0 OR len(lastname) eq 0>
            <cfset result.msg = "missing field">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfset salt = hash(rand("SHA1PRNG"), "SHA-512")>
        <cfset hash = hash(password&salt, "SHA-512")>

        <cftry>
            <cfquery name="searchUser" dataSource="#config.sourceName#">
                SELECT email FROM users WHERE email = "#email#"
            </cfquery>

            <cfif searchUser.RecordCount neq 0>
                <cfset result.msg = "email registered">
                <cfreturn serializeJSON(result)>
            </cfif>

            <cfquery name="createUser" dataSource="#config.sourceName#" result="insertUserResult">
                INSERT INTO users (email, pass_id, first_name, last_name, role_id, secret_question)
                    VALUES ('#email#', '0', '#firstname#', '#lastname#', '1', 'test_text')
            </cfquery>

            <cfquery name="createPassword" dataSource="#config.sourceName#" result="insertPwResult">
                INSERT INTO passwords (user_id, password, salt, type, active)
                    VALUES ('#insertUserResult.generated_Key#', '#hash#', '#salt#', '1', '0')
            </cfquery>

            <cfquery name="updatePwID" dataSource="#config.sourceName#">
                UPDATE users SET pass_id = '#insertPwResult.generated_Key#'
                    WHERE user_id = '#insertUserResult.generated_Key#'
            </cfquery>
            <cfcatch type="database">
                <cfset result.msg = "Error occur!">
                <cfreturn serializeJSON(result)>
            </cfcatch>
        </cftry>

        <cfset result.status = true>
        <cfset result.msg = "success created account">
        <cfreturn serializeJSON(result)>
    </cffunction>

</cfcomponent>