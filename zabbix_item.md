## Example Zabbix item setup:

- Name: Check SSL Certificate servername

- Type: Zabbix Agent

- Key: system.run[/usr/local/bin/checkssl.sh dns.bustraan.net]

- Host Interface: zabbix_server_ip_addr: 10050

- Type of Information: Numeric (unsigned)

- Update Interval: 1d

### Note: one Item required for every server monitored
