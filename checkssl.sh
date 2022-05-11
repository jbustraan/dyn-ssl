#!/usr/bin/bash

# checkssl.sh - script to check if SSL certificate is expiring from Zabbix Server. Passes 1 argument - server name to check.

if [ $# -ne 1 ]; then
 echo -e "\nYou must supply a server name.\n  Syntax: checkssl.sh server.domain.com\n"
 exit 1
else

   data=`echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -noout -enddate | sed -e 's#notAfter=##'`

   # uses epoch time math to determine seconds before cert expires remaining
   ssldate=`date -d "${data}" '+%s'`
   nowdate=`date '+%s'`
   diff="$((${ssldate}-${nowdate}))"

   # Zabbix expects unsigned integer output for Item - returns days rounded to 0 decimals
   echo $((${diff}/86400))

fi
