<cfset dbManager = createObject("component","components.dbManager").init()>

<cfinvoke component="#dbManager#" method="allUser" returnVariable="testReturn">
<cfinvoke component="#dbManager#" method="getUsername" returnvariable="userName">
<!--- <cfinvoke component="#dbManager#" method="insertUser"> --->

<!--- <cfset cfData=DeserializeJSON(userName)>
<cfset colList=ArrayToList(cfData.COLUMNS)>
    <cfset usernameIdx=ListFindNoCase(colList, "username")>
    
    <cfoutput>
        <cfloop index="i" from="1" to="#ArrayLen(cfData.DATA)#">
            <p>
                #cfData.DATA[i][usernameIdx]#
            </p>
        </cfloop>
    </cfoutput> --->

<cfoutput>
    #userName#<br>
</cfoutput>