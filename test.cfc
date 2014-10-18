<cfcomponent>
	<cffunction name="allUser" access="public" output="false" returntype="string">
        <cfquery name="getNames" datasource="teamD">
            SELECT * FROM users
        </cfquery>
		<cfreturn getNames.username/>
    </cffunction>
</cfcomponent>