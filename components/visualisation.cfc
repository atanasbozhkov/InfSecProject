<cfcomponent displayname="visualisationController" hint="">
    <cffunction name="getUsername" access="remote" returntype="string">
        <cfinvoke component="models.visualisationModel" method="getUsername" returnvariable="usernames">

        <cfset json=arrayNew(1)>
        <cfloop query="usernames">
            <cfset arrayAppend(json, #email#)>
        </cfloop>

        <cfreturn SerializeJSON(json)/>
    </cffunction>
</cfcomponent>