<cfobject component="test" name="testObj"/>
<cfinvoke component="#testObj#" method="allUser" returnVariable="testReturn">
<cfoutput>
#testReturn#
</cfoutput>