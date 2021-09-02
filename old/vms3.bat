echo installing sql server 2005
net use s: \\plato\software nelsov,1 /user:na\nelsons /persistent:no
pause
cd /d s:\MICROS~1\PC2JN00~\ENTERP~1
c:\PROGRA~1\DAEMON~1\daemon.exe -mount 0,en_sql_2005_ent_x86_cd1.iso
pause
start e:
net use t: \\plato\softdepot nelsov,1 /user:na\nelsons /persistent:nom
cd /d t:windows\SQLSER~1\ENTERP~1\
c:\PROGRA~1\DAEMON~1\daemon.exe -mount 0,EN_SQL~1.ISO
start f:
pause
echo snapshotting sql
