cat /etc/redhat-release  | tee version.log
if   grep -i -q '8' 'version.log'; then
    irun TESTBED.v -define RTL -debug -notimingchecks -loadpli1 debpli:novas_pli_boot
else
    irun TESTBED.v -define RTL -debug
fi
