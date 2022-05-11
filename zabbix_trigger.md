## Example Zabbix trigger setup:

### In order to send an alert if item reaches threshold, you need to add a Zabbix trigger.
- Name: SSL Certificate is Expiring on servername

- Severity Level: Whatever you deem appropriate - pick from available Zabbix types

- Expression: 
  ```{Zabbix server:system.run[/usr/local/bin/checkssl.sh dns.bustraan.net].last()}<10```
