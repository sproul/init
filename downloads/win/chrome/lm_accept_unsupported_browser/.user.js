// save this file as .user.js, and then browse it using chrome.  At the screen's bottom, you'll be prompted to install it.
// 
// @match http://*/LabManager
// @match https://*/LabManager
var all_html = document.getElementsByTagName('html')[0].innerHTML
if (all_html.match(/Warning: You are using an unsupported browser/))
{
    window.location.href = '/LabManager/Login.aspx'
}
