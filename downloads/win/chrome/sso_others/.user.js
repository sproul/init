// @match https://login.oracle.com/mysso/signon.jsp
// @match https://stbeehive.oracle.com/jsso/SSOLogin*
var u = 'nelson.sproul@oracle.com'
var p = 'Nelsov,2'
if (document.forms[0])
{
    if (document.forms[0].elements['ssousername'])
    {
        // orcl sso
        document.forms[0].elements['ssousername'].value = u
        if (document.forms[0].elements['password'])             document.forms[0].elements['password'].value = p
        document.forms[0].submit()
    }
    else if (document.forms[0].elements['j_username'])
    {
        // zimbra
        document.forms[0].elements['j_username'].value = u
        if (document.forms[0].elements['j_password'])           document.forms[0].elements['j_password'].value = p
        if (document.forms[0].elements['submit'])   document.forms[0].elements['submit'].click()
    }
}
