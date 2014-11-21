<cfcomponent displayname="initController" hint="init checking">

    <cffunction name="checkSchema" access="public" returntype="boolean">
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

</cfcomponent>