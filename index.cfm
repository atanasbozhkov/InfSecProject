<cfset testObj = createObject("component","components/test").init()>

<cfinvoke component="#testObj#" method="allUser" returnVariable="testReturn">
<cfinvoke component="#testObj#" method="getUsername" returnvariable="userName">

<cfset cfData=DeserializeJSON(userName)>
<cfset colList=ArrayToList(cfData.COLUMNS)>
    <cfset usernameIdx=ListFindNoCase(colList, "username")>
    <cfset emailIdx=listFindNoCase(colList, "email")>
    
    <cfoutput>
        <cfloop index="i" from="1" to="#ArrayLen(cfData.DATA)#">
            <p>
                #cfData.DATA[i][usernameIdx]#
                #cfData.DATA[i][emailIdx]#
            </p>
        </cfloop>
    </cfoutput>

<cfoutput>
    #userName#
</cfoutput>