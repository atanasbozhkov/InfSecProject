<cfcomponent displayname="visualisation" hint="get data">

	<cffunction name="getUsername" access="public" output="false" returntype="string">
        <cfquery name="getNames">
            SELECT email FROM users
        </cfquery>

        <cfset json=arrayNew(1)>
        <cfloop query="getNames">
            <cfset arrayAppend(json, #email#)>
        </cfloop>

        <cfreturn SerializeJSON(json)/>
    </cffunction>

</cfcomponent>