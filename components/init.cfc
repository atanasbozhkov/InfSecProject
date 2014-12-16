<cfcomponent displayname="initController" hint="init checking">

    <cffunction name="checkSchema" access="public" returntype="boolean">
        <cfinvoke component="config" method="getConfig" returnvariable="config">
        <cfif config.database eq "" OR config.sourcename eq "" OR config.emailAddr eq "">
            <cfreturn false>
        </cfif>

        <cfinvoke component="models.schemaModel" method="getSchema" returnvariable="schemaQuery">
        <cfif schemaQuery.RecordCount neq 5>
            <cfreturn false>
        </cfif>
        <cfreturn true>
    </cffunction>

    <cffunction name="createSchema" access="public" returntype="boolean">
        <cfinvoke component="models.schemaModel" method="createSchema" returnvariable="created">
        <cfreturn created>
    </cffunction>

    <cffunction name="finishedSetup" access="public" returntype="boolean">
        <cfinvoke component="config" method="getConfig" returnvariable="config">
        <cfif config.database eq "" OR config.sourcename eq "" OR config.emailAddr eq "">
            <cfreturn false>
        </cfif>

        <cfinvoke method="createSchema" returnvariable="created">
        <cfif created eq true>
            <cfset APPLICATION.setup = true>
        </cfif>
        <cfreturn created>
    </cffunction>

</cfcomponent>