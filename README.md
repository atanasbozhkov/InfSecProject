InfSecProject
=============

This is the team project source code repository for Group D for the MSc Information Security.

=======================
Configuation
=======================

Setup in the Admin page:
 - Data & Services > Data Sources
 Add a datasource with name and using driver MySQL 5

 - Server Settings > Memory Variables
 DONT click "Use J2EE session variables"
 DO click "Enable Application Variables" and "Enable Session Variables"

 - Server Settings > Mail
Configure the mail setting according to the mail server you are using

Setup in the component:
- The config file is the components/config.cfc, you may follow the comment in config.cfc to perform the configuration

File Directory:
- Place all files at the root directory of your website

=======================
APIs
=======================
User may use these 5 APIs in their website, these are based on ColdFusion and JavaScript

- login
<cfajaxproxy cfc="components.auth" jsclassname="auth">
var instance = new auth();
instance.login(username, password);

- logout
<cfajaxproxy cfc="components.auth" jsclassname="auth">
var instance = new auth();
instance.login(username, password);

- send password recovery email
<cfajaxproxy cfc="components.forgotten" jsclassname="forgotten">
var instance = new forgotten();
instance.sendLink(email);

- reset password
<cfajaxproxy cfc="components.forgotten" jsclassname="forgotten">
var instance = new forgotten();
instance.resetPassword(password, retypePassword, "<cfoutput>#url['token']#</cfoutput>");

- register new user
<cfajaxproxy cfc="components.register" jsclassname="register">
var instance = new register();
instance.register(email, password, firstName, lastName);

=================================
added authenticated needed pages
=================================
In the components/config.cfc, added the path of webpages to "variables.protectList", which paths should be seperated by ","
eg. if the demo.cfm and test.cfm at the root directory of the website is needed to be authenticated, 
variables.protectList = "demo.cfm, test.cfm"
