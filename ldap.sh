#!/bin/bash

pass="sen31994"


wget https://github.com/kenny2223/ldap/blob/main/issabel-ldap-1.0.0.tgz?raw=true -O issabel-ldap-1.0.0.tgz

tar -xvzf issabel-ldap-1.0.0.tgz
cd issabel-ldap-1.0.0

echo -e "$pass\n$pass\n" | make install 

chmod 666  /etc/sysconfig/issabel-ldap


wget https://github.com/kenny2223/ldap/blob/main/ldap.tar.gz?raw=true -O ldap.tar.gz

tar -xvzf ldap.tar.gz

cd ldap

#make the menu.xml
cat << EOF > menu.xml 
<?xml version="1.0" encoding="UTF-8"?>
<module>
<menulist>
<menuitem parent="agenda" module="yes" link="" menuid="ldap" desc="Ldap" order="3" />
</menulist>
</module>
EOF

issabel-menumerge ./menu.xml
rm -f ./menu.xml

#Copy  all modules to /var/www/html/modules/ de issabell
cp -r ./Modulos/* /var/www/html/modules/

cd ..

rm -rf ldap*
rm -rf issabel-ldap*




