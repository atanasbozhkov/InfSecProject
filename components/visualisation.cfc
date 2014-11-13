<cfcomponent displayname="visualisationController" hint="">
    <cffunction name="getUsername" access="remote" returntype="string">
        <cfinvoke component="models.visualisationModel" method="getUsername" returnvariable="usernames">

        <cfset json=arrayNew(1)>
        <cfloop query="usernames">
            <cfset arrayAppend(json, #email#)>
        </cfloop>

        <cfreturn SerializeJSON(json)/>
    </cffunction>

    <cffunction name="getLoginAttempts" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke component="models.visualisationModel" method="getLoginAttempts" returnvariable="attempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfset result.success=arrayNew(1)>
        <cfset result.fail=arrayNew(1)>
        <cfloop query="attempts">
            <cfset record.email = #email#>
            <cfset record.ip = #IP_addr#>
            <cfset record.device = #device_type#>
            <cfset record.comment = #comment#>
            <cfset record.timestamp = #timestamp#>
            <cfif #success# eq 0>
                <cfset arrayAppend(result.fail, record)>
            <cfelse>
                <cfset arrayAppend(result.success, record)>
            </cfif>
        </cfloop>

        <cfset result.totalSuccess = ArrayLen(result.success)>
        <cfset result.totalFail = ArrayLen(result.fail)>

        <cfreturn SerializeJSON(result)/>
    </cffunction>

    <cffunction name="getForgotAttempts" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke component="models.visualisationModel" method="getForgotAttempts" returnvariable="attempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfset result.success=arrayNew(1)>
        <cfset result.fail=arrayNew(1)>
        <cfloop query="attempts">
            <cfset record.email = #email#>
            <cfset record.ip = #IP_addr#>
            <cfset record.device = #device_type#>
            <cfset record.valid = #valid#>
            <cfset record.timestamp = #timestamp#>
            <cfif #success# eq 0>
                <cfset arrayAppend(result.fail, record)>
            <cfelse>
                <cfset arrayAppend(result.success, record)>
            </cfif>
        </cfloop>

        <cfset result.totalSuccess = ArrayLen(result.success)>
        <cfset result.totalFail = ArrayLen(result.fail)>

        <cfreturn SerializeJSON(result)/>
    </cffunction>
</cfcomponent>