InfSecProject
=============

This is the team project source code repository for Group D for the MSc Information Security.

Setup in the Admin page:
 - Data & Services > REST Services
 add a new service, put the directory of the components in the Root Path field (eg./Applications/ColdFusion11/cfusion/wwwroot/coldfusionComponent/components)
 put "securityCFC" in the Service Mapping

 - Data & Services > Data Sources
 add a datasource, use "PGT_TEAM_D_2014_TEST" in CF Data Source Name

 - Server Settings > Memory Variables
 DONT click "Use J2EE session variables"
 DO click "Enable Application Variables" and "Enable Session Variables"