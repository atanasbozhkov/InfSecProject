<cfcomponent displayname="DBManager" hint="datasource reader">
    <!--- variable initialize --->
    <cfinvoke component="config" method="getConfig" returnVariable="config">
    
    <!--- init function --->
    <cffunction name="init" access="public" returntype="dbManager">
        <cfreturn this />
    </cffunction>

    <cffunction name="allUser" access="public" output="false" returntype="query">
        <cfquery name="getAll" datasource="#config.sourceName#">
            SELECT * FROM users
        </cfquery>
        <cfreturn getAll/>
    </cffunction>

	<cffunction name="getUsername" access="public" output="false" returntype="string">
        <cfquery name="getNames" datasource="#config.sourceName#">
            SELECT username FROM users
        </cfquery>

        <cfset json=arrayNew(1)>
        <cfloop query="getNames">
            <cfset arrayAppend(json, #username#)>
        </cfloop>

        <cfreturn SerializeJSON(json)/>
    </cffunction>

    <cffunction name="getData" access="public" output="false" returntype="string">
        <cfset data = arrayNew(1)>
            <cfloop from="1" to="12" index="i" step="1">
                <cfset arrayAppend(data, #i#*20)>
            </cfloop>
        <cfreturn SerializeJSON(data)>
    </cffunction>

    <!--- test function --->
    <cffunction name="insertUser" access="public" output="false" returntype="void">
        <cfset firstname = "Ebay">
        <cfset lastname = "Bid">

        <cfquery datasource="#config.sourceName#" result="insertResult">
            INSERT INTO users (username, pass_id, first_name, last_name, email, secret_question, role_id)
                VALUES (
                    '#firstname#.#lastname#',
                    '1',
                    '#firstname#',
                    '#lastname#',
                    '#firstname#.#lastname#@gmail.com',
                    'test',
                    '1')
        </cfquery>
    </cffunction>

    <cffunction name="forgottenPassword" access="public" output="false"
        returntype="query">
        <cfset var getPassword="">
        <cfquery name="getPassword" datasource="cfdocexamples">
            SELECT * FROM Password
        </cfquery>
    </cffunction>
	<cffunction name="name" access="public" output="false"
        returntype="query">
        <cfset var UserList="">
        <cfquery name="EmpList" datasource="cfdocexamples">
            SELECT Firstname, Lastname
            FROM Users
        </cfquery>
    </cffunction>
	<cffunction name="fullname" access="public" output="false"
        returntype="query">
        <cfset var Userquery="">
        <cfquery name="Userquery" datasource="cfdocexamples">
            SELECT FirstName || ' ' || LastName AS FullName
            FROM User
        </cfquery>
    </cffunction>
	<cffunction name="UserId" access="public" output="false" returntype="query">
        <cfset var deptquery="">
        <cfquery name="Userid" datasource="cfdocexamples">
            SELECT UserId, FirstName || ' ' || LastName
            AS FullName
            FROM User
            ORDER BY Userid
        </cfquery>
    </cffunction>

</cfcomponent>
