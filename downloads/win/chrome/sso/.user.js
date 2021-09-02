// save this file as .user.js, and then browse it using chrome.  At the screen's bottom, you'll be prompted to install it.
// 
// @match https://login.oracle.com/mysso/signon.jsp
// @match https://stbeehive.oracle.com/jsso/SSOLogin*
var u = 'nelson.sproul@oracle.com'
var p = 'Nelsov,2'
if (document.forms[0].elements['ssousername'])
{
    // orcl sso
    document.forms[0].elements['ssousername'].value = u
    document.forms[0].elements['password'].value = p
    document.forms[0].submit()
}
else if (document.forms[0].elements['j_username'])
{
    // zimbra
    document.forms[0].elements['j_username'].value = u
    document.forms[0].elements['j_password'].value = p
    document.forms[0].elements['submit'].click()
}
