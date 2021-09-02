cd /d c:\
if not exist cygwin xcopy \\%src_host%\c$\cygwin cygwin /s /e /h /y /z /i
if not exist downloads md downloads
cd downloads
if not exist usb xcopy \\%src_host%\downloads\usb usb /s /e /h /y /z /i
cd \Users
if not exist nelsons xcopy \\%src_host%\c$\Users\nelsons nelsons /s /e /h /y /z /i

